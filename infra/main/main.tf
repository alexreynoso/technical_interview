# https://www.terraform.io/docs/modules/index.html
module "tech_int" {
  source          = "../modules/tech_int"
  ami             = var.ami
  instance_type   = var.instance_type
}
