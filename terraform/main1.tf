terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIARERXZ4JYRPUDH66G"
  secret_key = "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"
}

resource "aws_instance" "myinstance01" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  count = "1"
  security_groups = ["Microdegree-Devops"]
  key_name = "microdree"

  tags = {
    Name = "Jenkins-Server"
  }
}
resource "aws_instance" "myinstance02" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  count = "1"
  security_groups = ["Microdegree-Devops"]
  key_name = "microdree"

  tags = {
    Name = "tomcat-server"
  }
}
resource "aws_instance" "myinstance03" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  count = "1"
  security_groups = ["Microdegree-Devops"]
  key_name = "microdree"

  tags = {
    Name = "docker-server"
  }
}
