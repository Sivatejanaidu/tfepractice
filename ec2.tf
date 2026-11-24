resource "aws_instance" "dev_server" {
  count = 3
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id[count.index]
  associate_public_ip_address = var.associate_public_ip_address
  
  root_block_device{
    volume_size = var.root_block_device_volume_size
    volume_type = "gp3"
  }


  tags = {
    Name = "terraform-practice-server-${count.index + 1}"
  }

}