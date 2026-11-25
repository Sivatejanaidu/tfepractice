resource "aws_instance" "dev_server" {
  for_each = var.instances
  ami           = var.ami_id
  instance_type = each.value.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.instances[each.key].subnet_ids
  associate_public_ip_address = var.associate_public_ip_address
  
  root_block_device{
    volume_size = var.root_block_device_volume_size
    volume_type = "gp3"
  }


  tags = {
    Name = "terraform-practice-server-${each.value.environment}"
  }

}

#
