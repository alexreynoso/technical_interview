# https://www.terraform.io/docs/providers/aws/d/region.html
data "aws_region" "current" {}

# https://www.terraform.io/docs/providers/aws/d/availability_zones.html
data "aws_availability_zones" "current" {
  state                  = "available"
  all_availability_zones = true
   filter {
    name    = "opt-in-status"
    values  = ["opt-in-not-required"]
  }
}

# https://www.terraform.io/docs/providers/aws/d/caller_identity.html
data "aws_caller_identity" "current" {}

# https://www.terraform.io/docs/providers/aws/r/instance.html
#data "aws_ami" "this" {
#  owners      = [local.account_id]
#  most_recent = true
#  filter {  # make sure to match the ami created by packer
#    name   = "name"
#    values = [
#      format(
#        "%s-%s-%s",
#        local.region,
#        "technical-inte",
#        lower(var.distro))
#    ]
#  }
#}
