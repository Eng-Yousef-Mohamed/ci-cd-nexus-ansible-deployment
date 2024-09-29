
resource "aws_instance" "ec2"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.aws_subnet.id
    vpc_security_group_ids = [aws_security_group.security-group.id]
    depends_on = [aws_internet_gateway.internet_gateway]
    associate_public_ip_address = "true"
    user_data = file("${path.module}/script.sh")
    key_name = aws_key_pair.kp.key_name
    tags = {
        Name = var.Name_ec2,
        created-by="Yousef"
    }
    provisioner "local-exec" {
      command = <<EOT
      echo -e "[ec2] \n${self.public_ip}" >> inventory.ini
      EOT
    }
}