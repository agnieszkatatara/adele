data "template_file" "docker" {
  template = "${file("templates/docker.sh.tmpl")}"
}

data "template_cloudinit_config" "docker" {
  gzip          = 1
  base64_encode = 1

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.docker.rendered}"
  }
}