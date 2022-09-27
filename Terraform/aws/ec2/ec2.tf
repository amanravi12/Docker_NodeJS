terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.27.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARNFQEIDGTFXCW5JO"
  secret_key = "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"
}

resource "aws_instance" "aws"{
	ami = "ami-076e3a557efe1aa9c"
	instance_type = "t2.micro"

	  tags = {
    Name = "Aman OS"
  }
}