#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo "Starting user data script execution"

sudo yum update -y
sudo yum install -y docker
if [ $? -ne 0 ]; then
    echo "Failed to install Docker"
    exit 1
fi

sudo systemctl start docker
if [ $? -ne 0 ]; then
    echo "Failed to start Docker service"
    exit 1
fi

sudo systemctl enable docker

sudo usermod -aG docker ec2-user

timeout=60
while ! sudo docker info >/dev/null 2>&1; do
    if [ $timeout -le 0 ]; then
        echo "Timed out waiting for Docker to be ready"
        exit 1
    fi
    timeout=$(($timeout - 1))
    sleep 1
done

sudo docker run -d -p 8080:80 nginx
if [ $? -ne 0 ]; then
    echo "Failed to start Nginx container"
    exit 1
fi

echo "User data script completed successfully"