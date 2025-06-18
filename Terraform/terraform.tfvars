region      = "us-east-1"
db_username = "webapp_user"
db_password = "123Yash987"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnets = [
  "10.0.4.0/24",
  "10.0.5.0/24"
]

ami_id               = "ami-012867b8de898a1e6"
instance_type        = "t3.micro"
max_asg_size         = 3
min_asg_size         = 1
desired_asg_capacity = 1

db_name           = "webapp_db"
db_engine         = "mysql"
db_engine_version = "8.0.34"
allocated_storage = 20