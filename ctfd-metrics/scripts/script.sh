#!/bin/bash

# add user ctf
useradd -m ctfd
cd /home/ctfd/

# clone CTFd as ctfd user
sudo -u ctfd git clone https://github.com/CTFd/CTFd.git

# install awscli 
sudo apt-get update
apt-get -y install awscli

# install docker docker-compose
sudo apt-get -y install docker docker-compose pass

# insall gunicorn, pip3
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get -y install gunicorn
apt -y install python3-pip 

# install cerbot
sudo apt-get -y install software-properties-common
sudo apt-get -y install certbot python3-certbot-nginx
# install requirments for ctfd
cd /home/ctfd/CTFd
pip install -r requirements.txt

# clone dark mode
git clone https://github.com/0xdevsachin/CTFD-odin-theme.git /home/ctfd/CTFd/CTFd/themes/odin

# clone plugin

git clone https://github.com/sigpwny/ctfd-dynamic-challenges-mod.git /home/ctfd/CTFd/CTFd/plugins/dynamic_challenges_mod
#updating config file and uploader.py 
rm /home/ctfd/CTFd/CTFd/config.ini
rm /home/ctfd/CTFd/CTFd/utils/uploads/uploaders.py
cp /root/files/uploaders.py /home/ctfd/CTFd/CTFd/utils/uploads/uploaders.py
cp /root/files/config.ini /home/ctfd/CTFd/CTFd/config.ini

# copy gunicron files
cp /root/files/gunicorn.service /etc/systemd/system/gunicorn.service
cp /root/files/gunicorn.socket /etc/systemd/system/gunicorn.socket
cd /etc/systemd/system

# start and enable gunicorn
systemctl enable --now gunicorn.socket
systemctl start gunicorn.service

# install and set up firewalls
sudo apt -y install nginx ufw
sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw allow 9101
echo 'y' | sudo ufw enable

# update nginx config files
cd /etc/nginx
rm nginx.conf
cp /root/files/nginx.conf /etc/nginx/nginx.conf
cd sites-enabled
rm default
cp /root/files/2022.magpiectf.ca /etc/nginx/sites-available/2022.magpiectf.ca
sudo ln -s /etc/nginx/sites-available/2022.magpiectf.ca /etc/nginx/sites-enabled/2022.magpiectf.ca

# udpate size of string for team db

rm /home/ctfd/CTFd/migrations/versions/8369118943a1_initial_revision.py
cp /root/files/8369118943a1_initial_revision.py /home/ctfd/CTFd/migrations/versions/8369118943a1_initial_revision.py  

# certbox certificate for 2022.magpiectf.ca
rm -rf /etc/letsencrypt
cp -r /root/files/letsencrypt /etc/letsencrypt
systemctl restart nginx


# import backup 
cd /home/ctfd/CTFd
python3 manage.py import_ctf /root/files/backup.zip

#back up ctfd
cd /root/files/scripts
chmod +x s3-backup.sh
sed -i -e 's/\r$//' s3-backup.sh
(crontab -l 2> /dev/null; echo "0 3 */1 * * /root/files/scripts/s3-backup.sh") | crontab 
exit 0