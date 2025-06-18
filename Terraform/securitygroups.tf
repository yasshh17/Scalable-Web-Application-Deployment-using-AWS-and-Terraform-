# security_groups.tf

# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "webapp-alb-sg"
  description = "Allow HTTP traffic on port 80"
  vpc_id      = aws_vpc.webapp_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb-sg"
  }
}

# Security Group for EC2 Instances (Web Servers)
resource "aws_security_group" "ec2_sg" {
  name        = "webapp-ec2-sg"
  description = "Allow HTTP traffic from ALB"
  vpc_id      = aws_vpc.webapp_vpc.id

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ec2-sg"
  }
}

# Security Group for RDS Instance
resource "aws_security_group" "rds_sg" {
  name        = "webapp-rds-sg"
  description = "Allow MySQL traffic from EC2 instances"
  vpc_id      = aws_vpc.webapp_vpc.id

  ingress {
    description     = "PostgreSQL from EC2 instances"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }
  tags = {
    Name = "rds-sg"
  }

}
