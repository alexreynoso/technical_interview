# MAIN FILE TO BUILD THE AMI

build {
  sources = ["source.amazon-ebs.this"]
  provisioner "shell" {
    scripts = [
      format(
        "%s/%s",
        lookup(var.ansible, "dir", ""),
        lookup(var.ansible, "file", "")
      )
    ]
  }
  provisioner "ansible-local" {
    playbook_dir    = lookup(var.playbook, "dir", "")
    playbook_file   = format(
      "%s/%s",
      lookup(var.playbook, "dir", ""),
      lookup(var.playbook, "file", ""))
  }
  post-processor "manifest" {
    output = replace("./pkr-${local.ami_name}.json", "-", "_")
  }
}
