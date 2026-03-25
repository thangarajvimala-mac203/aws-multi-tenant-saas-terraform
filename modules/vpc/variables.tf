variable "vpc_cidr" {
    description = "cidr block for VPC"
    type        = string
}

variable "public_subnets" {
    description = "public subnets CIDR's"
    type        = list(string)
}

variable "private_app_subnets" {
    description = "private app subnets CIDR's"
    type        = list(string)
}

variable "private_db_subnets" {
    description = "private DB SUBNETS CIDR's"
    type        = list(string)
}

variable "azs" {
    description = "Availability Zones"
    type        = list(string)
}
