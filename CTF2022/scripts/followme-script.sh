#! /bin/bash
sleep 20
sudo apt-get update
sudo apt-get -y install gunicorn python3 python3-pip unzip nginx
sudo useradd -m deployer

# docker setup stuff
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'
sudo apt-get update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo apt install -y docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker deployer
sleep 5

# ecr login and pulling the images
sudo apt-get -y install awscli pass
sudo aws ecr get-login-password --region us-east-2 | sudo docker login --username AWS --password-stdin <accountID>.dkr.ecr.us-east-2.amazonaws.com
sudo docker pull <accountID>.dkr.ecr.us-east-2.amazonaws.com/follow-me
sudo docker tag <accountID>.dkr.ecr.us-east-2.amazonaws.com/follow-me:latest follow-me:latest
echo CONTAINER_NAME='follow-me' | sudo tee -a /etc/environment
echo SSH_USERNAME='magpie' | sudo tee -a /etc/environment
echo SSH_PASSWORD='keyissecret' | sudo tee -a /etc/environment
echo IP_ADDR=$(curl http://checkip.amazonaws.com/) | sudo tee -a /etc/environment
# set ip addr as env variable
export IP_ADDR=$(/sbin/ip -o -4 addr list eth0 | head -n 1 | awk '{print $4}' | cut -d/ -f1)

# get server files
sudo cd /home/deployer
sudo runuser -l deployer -c 'wget https://github.com/jgpstuart/flask-container-deployer/archive/main.zip'
sudo runuser -l deployer -c 'unzip main.zip'
rm main.zip
sudo pip install -r /home/deployer/flask-container-deployer-main/requirements.txt
echo "IP_ADDR=$(curl http://checkip.amazonaws.com/)" >> /home/deployer/flask-container-deployer-main/gunicorn-vars


# setup gunicorn
sudo cp /home/deployer/flask-container-deployer-main/containerDeploy.service /etc/systemd/system/containerDeploy.service
#   "sudo systemctl enable containerDeploy.service
sudo systemctl start containerDeploy.service

# allow nginx in ufw
sudo ufw allow 'Nginx Full'

# setup nginx
sudo cp /home/deployer/flask-container-deployer-main/nginxConfig /etc/nginx/sites-available/containerDeploy
sudo ln -s /etc/nginx/sites-available/containerDeploy /etc/nginx/sites-enabled
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/.default
sudo mv /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/.default
sudo systemctl restart nginx
# setup the cron job to delete the containers after 10 minutes
sudo crontab -u root -l; echo '*/1 * * * * /usr/bin/python3 /home/deployer/flask-container-deployer-main/killScript.py' | crontab -u root -

exit 0