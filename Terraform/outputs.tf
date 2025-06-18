# outputs.tf

output "vpc_id" {
  value = aws_vpc.webapp_vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id,
    aws_subnet.public_subnet_3.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]
}

output "alb_dns_name" {
  value = aws_lb.webapp_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.webapp_db.endpoint
}
