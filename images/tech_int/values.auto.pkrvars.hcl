# DEFAULT VALUES FOR THE VARIABLES
os            = {
  ubuntu = "Linux"
  redhat = "Linux"
  amazon = "Linux"
}
ssh           = {
  ubuntu = "ubuntu"
  redhat = "ec2-user"
  amazon = "ec2-user"
}
region        = "us-east-1"
distro        = "ubuntu"
ansible       = {
  dir = "../scripts/ansible"
  file = "ansible_ubuntu.sh"
}
playbook      = {
  dir = "../playbooks"
  file = "tech_int.yml"
}
ami_owner     = {
  ubuntu = "679593333241"
  redhat = "309956199498"
  amazon = "amazon"
}
ami_filter    = {
  ubuntu = "ubuntu/images/hvm-ssd/*ubuntu-focal-20.04-amd64-server-*"
  redhat = "TODO"
  amazon = "TODO"
}
volume_size   = 8
instance_type = "t2.micro"
