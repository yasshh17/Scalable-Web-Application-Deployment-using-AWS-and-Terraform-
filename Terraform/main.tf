terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "webapp_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "webapp-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnet_1" {
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = "us-east-1a"
  vpc_id                  = aws_vpc.webapp_vpc.id
  map_public_ip_on_launch = true
  tags                    = { Name = "public-subnet-1" }
}

resource "aws_subnet" "public_subnet_2" {
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = "us-east-1b"
  vpc_id                  = aws_vpc.webapp_vpc.id
  map_public_ip_on_launch = true
  tags                    = { Name = "public-subnet-2" }
}

resource "aws_subnet" "public_subnet_3" {
  cidr_block              = var.public_subnet_3_cidr
  availability_zone       = "us-east-1c"
  vpc_id                  = aws_vpc.webapp_vpc.id
  map_public_ip_on_launch = true
  tags                    = { Name = "public-subnet-3" }
}

# Private Subnet
resource "aws_subnet" "private_subnet_1" {
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.webapp_vpc.id
  tags              = { Name = "private-subnet-1" }
}

resource "aws_subnet" "private_subnet_2" {
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "us-east-1b"
  vpc_id            = aws_vpc.webapp_vpc.id
  tags              = { Name = "private-subnet-2" }
}
  
# Internet Gateway
resource "aws_internet_gateway" "webapp_igw" {
  vpc_id = aws_vpc.webapp_vpc.id
  tags   = { Name = "webapp-igw" }
}

# Route Table for Public Subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.webapp_vpc.id
}
  
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.webapp_igw.id
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id    
  route_table_id = aws_route_table.public_route_table.id
} 

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
 
resource "aws_route_table_association" "public_subnet_3_association" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.public_route_table.id
}
  
# Route Table for Private Subnets (Updated with 2 private subnets)
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.webapp_vpc.id
}
  
# Associate Private Subnet 1 (Subnet 4) with the private route table
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}
  
# Associate Private Subnet 2 (Subnet 5) with the private route table
resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

