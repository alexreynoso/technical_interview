# SETUP VARIABLES WITH AWS ACCOUNT INFORMATION
locals {
  #ami                = data.aws_ami.this.id
  region             = data.aws_region.current.name
  account_id         = data.aws_caller_identity.current.account_id
  availability_zones = data.aws_availability_zones.current.names
}
