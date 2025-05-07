##################
# Common Variables
##################
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default = {
    Name       = "Youngs"
    Owner      = "Farajnazish Ansari"
    Manger     = "Alpesh Bhavsar"
    Project    = "Werfen"
    Department = "PES-DevOps"
  }
}

#####
# VPC
#####
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

##########
# Subnet 1
##########
variable "sub_1_cidr" {
  description = "CIDR block for Subnet 1"
  type        = string
  default     = "10.1.1.0/24"
}

variable "sub_1_az" {
  description = "Availability zone for Subnet 1"
  type        = string
  default     = "us-east-1a"
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for Subnet 1"
  type        = bool
  default     = true
}

##########
# Subnet 2
##########
variable "sub_2_cidr" {
  description = "CIDR block for Subnet 1"
  type        = string
  default     = "10.1.2.0/24"
}

variable "sub_2_az" {
  description = "Availability zone for Subnet 1"
  type        = string
  default     = "us-east-1b"
}

#############
# Route Table
#############
variable "igw_route" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}