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
  access_key = ""
  secret_key = ""
}

resource "aws_key_pair" "tf-key-pair" {
key_name = "tf-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "tf-key-pair"
}



resource "aws_instance" "myinstance01" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  count = "1"
  security_groups = ["Microdegree-Devops"]




  tags = {
    Name = "Server_1-W1"
  }



}
resource "aws_instance" "myinstance02" {
  ami           = "ami-0c9978668f8d55984"
  instance_type = "t2.micro"
  count = "1"
  security_groups = ["Microdegree-Devops"]


  tags = {
    Name = "Server_2-W1"
  }

}
