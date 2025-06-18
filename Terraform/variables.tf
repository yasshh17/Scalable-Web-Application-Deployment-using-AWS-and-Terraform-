# variables.tf

# Database Engine
variable "db_engine" {
  description = "The database engine (e.g., MySQL, PostgreSQL, etc.)"
  type        = string
  default     = "mysql"
}

# Database Engine Version
variable "db_engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "8.0.34"
}

# Allocated Storage
variable "allocated_storage" {
  description = "The allocated storage for the database (in GB)"
  type        = number
  default     = 20
}

# Region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Public Subnets
variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# Private Subnets
variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

# Auto Scaling Group Variables
variable "max_asg_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
  default     = 3
}

variable "min_asg_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
  default     = 1
}

variable "desired_asg_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
  default     = 1
}
  
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}
  
variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  default     = "10.0.2.0/24"
}
 
variable "public_subnet_3_cidr" {
  description = "CIDR block for public subnet 3"
  default     = "10.0.3.0/24"
}
  
variable "private_subnet_1_cidr" {
   description = "CIDR block for private subnet"
  default     = "10.0.4.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet"
  default     = "10.0.5.0/24"
} 

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
} 

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-012867b8de898a1e6"
}
  
variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
  
variable "db_port" {
  description = "The database port number"
  type        = number
  default     = 5432
}
 

variable "db_name" {
  description = "RDS Database name"
  default     = "webapp_db"
}

variable "db_username" {
  description = "RDS database username"
  default     = "webapp_admin"
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  default     = "123Yash987"
  sensitive   = true
}

