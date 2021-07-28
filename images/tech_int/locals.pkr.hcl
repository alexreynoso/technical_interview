locals { # ami settings
 ami_name = format(
 "%s-%s-%s",
 var.region,
 "technical-inte",
 lower(var.distro))
}
