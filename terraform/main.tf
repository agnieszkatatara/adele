provider "aws" {
  region                   = "eu-west-1"
  shared_credentials_file  = "/Users/agnieszkat/.aws/private_acc"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name   = "Adele"
    Client = "UXPin"
  }
}