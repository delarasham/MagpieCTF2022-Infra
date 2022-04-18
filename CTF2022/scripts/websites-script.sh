#!/bin/bash

# initial config
sudo apt-get -o DPkg::Lock::Timeout=-1 update
sudo apt-get -y install docker docker-compose pass
sudo apt-get -y install awscli pass
sudo usermod -aG docker ubuntu

# login to ECR to pull images 
aws ecr get-login-password --region us-east-2 | sudo docker login --username AWS --password-stdin <accountID>.dkr.ecr.us-east-2.amazonaws.com

# running the website images 
sudo docker-compose -f /home/ubuntu/files/compose/docker-compose.yml up -d

# setting up the certificate 
sudo apt -y install nginx
cd /etc/nginx/sites-enabled
rm default
cp /home/ubuntu/files/omni-mompops.conf /etc/nginx/sites-available/omni-mompops.conf
sudo ln -s /etc/nginx/sites-available/omni-mompops.conf /etc/nginx/sites-enabled/omni-mompops.conf 
rm -rf /etc/letsencrypt
cp -r /home/ubuntu/files/letsencrypt /etc/letsencrypt
systemctl restart nginx