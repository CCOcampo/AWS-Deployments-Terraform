#1.Provider.tf
variable "aws_region" {
  description = "La región de AWS en la que desplegar los recursos."
  type        = string
  default     = "us-east-1"
}

#2.VPC
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

#3.Subnets
# Variables para los CIDR blocks de las subredes
variable "public_subnet_az1_cidr" {
  description = "CIDR block for the public subnet in AZ1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for the public subnet in AZ2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_az1_cidr" {
  description = "CIDR block for the private subnet in AZ1"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_subnet_az2_cidr" {
  description = "CIDR block for the private subnet in AZ2"
  type        = string
  default     = "10.0.5.0/24"
}

# Variables para las Zonas de Disponibilidad
variable "az_1" {
  description = "The availability zone for the first subnet"
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "The availability zone for the second subnet"
  type        = string
  default     = "us-east-1b"
}

#RDS
variable "app_name" {
  description = "Name for the application"
  type        = string
  default     = "movierds-app"
}

variable "db_user" {
  type = string
  default = "admin"
}

variable "db_password" {
  type = string
  sensitive = true
  default = "admin123"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "movie_db"
}

variable "rds_port" {
  description = "Port for the RDS instance"
  type        = number
  default     = 3306
}

variable "backfront_port" {
  description = "Port for the backend and frontend instances"
  type        = number
  default     = 80
}
