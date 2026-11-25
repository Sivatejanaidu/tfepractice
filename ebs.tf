resource "aws_ebs_volume" "data" {
  for_each = {
    for item in flatten([
      for instance_key, instance in var.instances : [
        {
          key          = "${instance_key}-data1"
          instance_key = instance_key
          size         = 10
        },
        {
          key          = "${instance_key}-data2"
          instance_key = instance_key
          size         = 20
        }
      ]
    ]) : item.key => item
  }

  availability_zone = aws_instance.dev_server[
    each.value.instance_key
  ].availability_zone

  size = each.value.size
  type = "gp3"

  tags = {
    Name = each.key
  }
}

resource "aws_volume_attachment" "data" {
  for_each = {
    for item in flatten([
      for instance_key, instance in var.instances : [
        {
          key          = "${instance_key}-data1"
          instance_key = instance_key
          device_name  = "/dev/sdf"
        },
        {
          key          = "${instance_key}-data2"
          instance_key = instance_key
          device_name  = "/dev/sdg"
        }
      ]
    ]) : item.key => item
  }

  device_name = each.value.device_name

  volume_id = aws_ebs_volume.data[each.key].id

  instance_id = aws_instance.dev_server[
    each.value.instance_key
  ].id
}