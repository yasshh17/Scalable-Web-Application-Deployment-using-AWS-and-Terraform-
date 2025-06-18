resource "aws_db_subnet_group" "webapp_db_subnet_group" {
  name       = "webapp-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "webapp-db-subnet-group"
  }
}

resource "aws_db_parameter_group" "webapp_db_params" {
  family = "postgres16"
  name   = "webapp-db-params"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }
}

resource "aws_db_instance" "webapp_db" {
  identifier             = "webapp-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.webapp_db_subnet_group.name
  parameter_group_name   = aws_db_parameter_group.webapp_db_params.name
  tags = {
    Name = "webapp-database"
  }
}
