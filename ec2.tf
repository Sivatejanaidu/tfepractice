resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id[0]
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = "terraform-practice-server"
  }

}