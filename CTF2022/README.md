
## To Deploy
```
terraform plan
terraform apply
```
## To Destroy

```
terraform destroy
```

## To Redeploy Instances
### Challenge servers 1,2,3,4 and sites
- Go to file `ec2.tf` and find the instance you want to destroy
- Comment the `count` of the server and uncomment `count = 0`  
- Go to file `elb` and find the `aws_elb_attachment` for the server
- Comment the `count` of the attachment and uncomment `count = 0`
- `terraform apply`
- Change those count back to what they were
- `terraform apply`
### Challenge server 5 (followme)
- Go to file `ec2.tf` and find the instance called `srv5`
- Comment the instance code
- Go to file `dns.tf` and find `srv5` record
- Comment that record
- `terraform apply`
- Uncomment them
- `terraform apply`

**DO NOT TERRAFORM DESTROY DURING COMPETITION**