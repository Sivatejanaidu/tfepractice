variable "ami_id" {
  type        = string
  description = "EC2 ami idfor the test server"
  default     = "null"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance_type the test server"
}
