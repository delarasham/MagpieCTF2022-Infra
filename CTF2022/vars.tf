# cloudflare api token for momandpopsflags and omniflags
variable "cloudflare_api_token" {
  type    = string
}
#  zone id for momandpopsflags.ca
variable "cloudflare_zone_id" {
  type    = string
}
# zone id for omni

variable "omni_zone_id"{
  type = string
}
# aws region 
variable "aws_region" {
  default = "us-east-2"
}
# aws profile containing the keys 
variable "aws_profile" {
  default = "ctf2022-user"
}
#aws keys
variable "aws_access_key"{
}
variable "aws_secret_key"{
}
variable "aws_instance_key" {
  default = "ctf2022-key"
}

variable "ubuntu_ami" {
  default = "ami-0fb653ca2d3203ac1"
}
variable "instance_type" {
  default = "t2.micro"
    # default = "c6i.xlarge"
}

# availability zones
variable "azs" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b"]
}
variable "vpc_cidr" {
  default = "10.20.0.0/16"
}
variable "subnets_cidr_srv1" {
  type = list(string)
  #   default = ["10.20.1.0/24", "10.20.2.0/24"]
  default = ["10.20.1.0/24"]

}

variable "subnets_cidr_srv2" {
  type = list(string)
  #   default = ["10.20.3.0/24", "10.20.4.0/24"]
  default = ["10.20.3.0/24"]

}
variable "subnets_cidr_srv3" {
  type = list(string)
  #   default = ["10.20.5.0/24", "10.20.6.0/24"]
  default = ["10.20.5.0/24"]
}
variable "subnets_cidr_srv4" {
  type = list(string)
  #   default = ["10.20.11.0/24", "10.20.12.0/24"]
  default = ["10.20.11.0/24"]
}
#followme 
variable "subnets_cidr_srv5" {
  type = string
  #   default = ["10.20.7.0/24", "10.20.8.0/24"]
  default = "10.20.7.0/24"
}
# subnet cidr for sites 

variable "subnets_cidr_sites"{
  type = list(string)
   #   default = ["10.20.9.0/24", "10.20.10.0/24"]
  default = ["10.20.9.0/24"]

}

##################################################################
################### turn key variables ###########################
##################################################################


variable "key_period" {
  type = number
  default = 2300
}

variable "protocol_time" {
  type = number
  default = 360
}


variable "do_token" {
  type    = string
}

variable "do_container_registry_token" {
  type    = string
}


