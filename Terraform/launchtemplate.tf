# launch_template.tf

resource "aws_launch_template" "webapp_lt" {
  name_prefix   = "webapp-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ec2_sg.id]
  }


  user_data = base64encode(<<-EOF
              #!/bin/bash
              # Create environment file
              cat << 'ENVFILE' > /usr/bin/csye6225/.env
              DB_HOST=${aws_db_instance.webapp_db.address}
              DB_PORT=5432
              DB_USERNAME=${aws_db_instance.webapp_db.username}
              DB_PASSWORD=${aws_db_instance.webapp_db.password}
              DB_NAME=${aws_db_instance.webapp_db.db_name}
              ENVFILE

              # Set proper permissions
              sudo chmod 600 /usr/bin/csye6225/.env
              sudo chown csye6225:csye6225 /usr/bin/csye6225/.env

              # Start webapp service
              sudo systemctl start webapp.service
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "WebApp Instance"
    }
  }

}