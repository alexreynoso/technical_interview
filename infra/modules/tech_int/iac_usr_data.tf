data "template_file" "this" {
  template = file("${path.module}/ec2.tpl")
}
