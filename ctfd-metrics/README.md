# Description
This folder contains scripts for deploying two ctfd intance on digital ocean. It relies on the existence of a Redis database and a MySQL database. 
# Deploy
```bash
terraform plan
terraform destroy
```

# Destroy
```bash
terraform destroy
```
# If CTFd goes down
## Check if databases are up
- Login to digitalocean and switch to infosec team
- Go to the CTFd project
- Makes sure the databases named `db-redis-sfo3-71223` and `db-mysql-sfo3-98742` are up so that they have a green light beside them.
- Click on one or both of droplets named `ctfd-prod` and take a snapshot of it.

## Databases are up
- Go to folder `ctfd-metrics` in `MagpieCTF2022-hosting` reposity. 
- In the file named `droplet.tf` line `11` change the count to `0`
- `terraform apply`
- Change the count back to `2`
- `terraform apply`
## Databases are down
- You need to create a database for mysql and one for redis
- Go to the CTFd project in digitalocean
- Click `create` and then `databases`
- Choose `mysql` with node plan `$60/month`
- Choose `sfo3` for the datacenter and create
- Do the above for a `redis` server
- Click on the `redis` database you just created in overview
- In `connection details` choose `connection string` and copy the link
- Go to the file `files/config.ini` and replace the link in line `38` with the new link
- For your mysql server do the above but copy part of the link that starts with `doadmin` and ends with `defaultdb`
- Go to the file `ctfd-metrics/files/config.ini` and replace the link in line `31` with the new link but only the part that starts with `doadmin` and end with `defaultdb`
- Go to the `ctfd-metrics/scripts/script.sh` and uncomment lines `80-82`
- Go to our amazon account and login using the credentials in bitwarden
- Go to `s3` 
- Find the bucket called `ctfd-backups-ctf2022` and download the lates ctfd backup (it should be the last file in the list)
- Move this file to `ctfd-metrics/files` and rename it to `backup.zip`
- In the file named `droplet.tf` line `11` change the count to `0`
- `terraform apply`
- Change the count back to `2`
- `terraform apply`
- Once droplets are up go to each of the droplet ips (they will be printed by the script but you can also find them in digitalocean) and login using the credintials in bitwarden
- Go to admin panel and then config
- Go to theme and change the theme to odin
- Do this for both droplets
- Your DONE!!

# Terraform commands
## To see the changes that will be made
`terraform plan`

## To apply those changes
`terraform apply`

## To destroy all the infrastructure
`terraform destroy`

## To destroy a specific resource
`terraform destroy -target=resource_type.resource_name`   
- ex: `terraform destroy --target=digitalocean_droplet.ctfd-metrics`
