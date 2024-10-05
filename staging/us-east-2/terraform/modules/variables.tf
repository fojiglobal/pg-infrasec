variable "vpc_cidr" {
    type = string
}

variable "env" {
    type = string
}

###### Public Subnet Variables #####

variable "public_subnets" {
    type = map(object({
      cidr = string
      azs = string
      tags = map(string)
    }))
  }

  ###### Private Subnet Variables #####

variable "private_subnets" {
    type = map(object({
      cidr = string
      azs = string
      tags = map(string)
    }))
  }

variable "pub-sub-name" {
    type = string
  }

  variable "all_ipv4_cidr" {
    type = string
    default = "0.0.0.0/0"
  }

  variable "ami_id" {
    type = string
    default = "ami-085f9c64a9b75eed5"    
  }

  variable "instance_type" {
    type = string
    default = "t2.micro"    
  }

  variable "instance_key" {
    type = string
    default = "cs2-use2-main"    
  }

  variable "user_data" {
    type = string    
  }

  variable "max_size" {
    type = number  
    default = 2
  }

  variable "min_size" {
    type = number
    default = 1   
  }

  variable "desired_capacity" {
    type = number
    default = 2
  }

  variable "public_sg_ingress" {
    type = map(object({
      src = string
      from_port = number
      to_port = number
      ip_protocol = string
      description = string
    }))
  }

    variable "public_sg_egress" {
    type = map(object({
      dest = string
      ip_protocol = string
      description = string
    }))
  }

variable "private_sg_ingress" {
    type = map(object({
      src = string
      from_port = number
      to_port = number
      ip_protocol = string
      description = string
    }))
  }

    variable "private_sg_egress" {
    type = map(object({
      dest = string
      ip_protocol = string
      description = string
    }))
  }

 variable "bastion_sg_ingress" {
    type = map(object({
      src = string
      from_port = number
      to_port = number
      ip_protocol = string
      description = string
    }))
  }

    variable "bastion_sg_egress" {
    type = map(object({
      dest = string
      ip_protocol = string
      description = string
    }))
  }
