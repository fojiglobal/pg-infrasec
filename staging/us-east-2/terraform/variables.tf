variable "staging_vpc_cidr" {
  type    = string
  default = "10.35.0.0/16"
}

variable "qa_vpc_cidr" {
  type    = string
  default = "10.40.0.0/16"
}

variable "use2a" {
  type    = string
  default = "us-east-2a"
}

variable "use2b" {
  type    = string
  default = "us-east-2b"
}