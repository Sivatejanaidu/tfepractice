ami_id = "ami-0593d733c2fc5bd2e"
associate_public_ip_address = true
security_group_ids = ["sg-0f541cfaca8047192", "sg-0d5c996e4cbbe4220", "sg-0f33819e5dd1d054e"]
# subnet_id = "subnet-0e2adaaf3dc92dbbb"
root_block_device_volume_size = 10
instances = {
  app1 = {
    instance_type = "t3.micro"
    environment   = "dev"
    subnet_ids = "subnet-0e2adaaf3dc92dbbb"
  }

  app3 = {
    instance_type = "t3.medium"
    environment   = "prod"
    subnet_ids= "subnet-0a6ff76c14ff60c81"
  }

  batch1 = {
  instance_type = "t3.large"
  environment   = "uat"
  subnet_ids = "subnet-0e2adaaf3dc92dbbb"
}
}