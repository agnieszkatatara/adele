resource "aws_instance" "webapp" {
    ami                         = "ami-a625b8df"
    instance_type               = "t2.micro"

    associate_public_ip_address = true
    security_groups             = ["allow_all"]
    key_name                    = "uxpin_public_key"
    user_data                   = "${data.template_cloudinit_config.docker.rendered}"

    tags {
        Name   = "Webapp"
        Client = "UXPin"
    }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow inbound traffic ssh and http, outbound open"

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name   = "Allow_all"
    Client = "UXPin"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "uxpin_public_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdg9tCgekqyNIt4oGfHBWFgGRBb6CaloH4twabSQFU5Mv4sKcowvWzA42NsY3nmDRNLio7/MIG/UGEHPcW8kGi/HHA1b2ONcMxY8VbLj+ZOGxzDv6/WLwgQ63mBXJ1/aoeaXO1ZPEj7ncFowT99SgemwEB32+s2SlzRN7gqkXTdyvTzTYlt5ecxY16tXr1bdWao0alzm87g+rQ2BSEGm/x5htEPB7FAgZkOxePRUYyJeMJ/xDUSK2T24ZEmzPrBZAhNBEL61HlEPrWhffZ8j7wsGLaia118fxLEdfRGVMemwRratLYPR/4XpzEfLHnHskyFVLrQ9IGfNJ0FeWQMOsx"
}
