source "amazon-ebs" "this" {
  region           = var.region
  ami_name         = local.ami_name
  ssh_username     = lookup(var.ssh, var.distro, "na")
  communicator     = "ssh"
  instance_type    = var.instance_type
  ami_description  = "Tech int AMI"
  force_deregister = true
  subnet_filter {
    random    = true
    most_free = false
  }
  source_ami_filter {
    owners      = [lookup(var.ami_owner, var.distro, "na")]
    most_recent = true
    filters     = {
      name                = lookup(var.ami_filter, var.distro, "")
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
  }
  launch_block_device_mappings {
    encrypted             = true
    device_name           = "/dev/sda1"
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags             = {
      Name        = "Tech int AMI"
      Description = "Tech int AMI"
    }
}
