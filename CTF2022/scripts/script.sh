#!/bin/bash
sudo apt-get update
sudo apt-get -y install docker docker-compose pass
sudo apt-get -y install awscli pass
sudo usermod -aG docker ubuntu
aws ecr get-login-password --region us-east-2 | sudo docker login --username AWS --password-stdin <accountID>.dkr.ecr.us-east-2.amazonaws.com
sudo docker-compose -f /home/ubuntu/docker-compose.yml up -d