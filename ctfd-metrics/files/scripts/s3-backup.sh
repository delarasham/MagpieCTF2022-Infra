#!/bin/bash

#export ctfd using manage.py
cd /home/ctfd/CTFd
python3 manage.py export_ctf > /root/files/scripts/output.txt

#find the name of the file and store it in backupname
cd /root/files/scripts
grep "magp" output.txt | sed 's/Exported //' > name.txt
backupname=$(cat name.txt)

# s3 bucket name 
S3_BUCKET="ctfd-backups-ctf2022"

# upload backup to s3 
python3 s3-uploader.py /home/ctfd/CTFd/"${backupname}" "${backupname}" "${S3_BUCKET}"

# remove files 
rm /home/ctfd/CTFd/"${backupname}" name.txt output.txt