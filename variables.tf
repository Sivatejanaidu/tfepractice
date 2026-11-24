variable "ami_id" {
  type        = string
  description = "EC2 ami idfor the test server"
  default     = "null"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance_type the test server"
}

variable "subnet_id" {
  type        = list(string)
  description = "List of subnet IDs for the EC2 instance"
}


variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the EC2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "whether to associate a public IP address with the instance"
}

public_ip