provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
resource "aws_vpc" "awesome_vpc" {
  cidr_block = "10.10.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "awesome_vpc"
  }
}




#___________________ services -INET
resource "aws_subnet" "services" {
 vpc_id     = var.vpc
cidr_block = "10.10.3.0/24"
tags = {
   Name = "services"
  }
}

resource "aws_network_interface" "ser2" {
  subnet_id       = "subnet-0308f3f997b4ef036"
  security_groups = ["sg-091b2b6f9be99f184"]
}
resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc
}


#____________________ back NAT
resource "aws_subnet" "back" {
 vpc_id     = var.vpc
 cidr_block = "10.10.4.0/24"

  tags = {
    Name = "back"
  }
}

resource "aws_nat_gateway" "back" {
  allocation_id = "eipalloc-0167d325bd7149a7f"
  subnet_id     = "subnet-0b7c4f901d58a50b9"

  tags = {
    Name = "for back"
  }
}



#_____________________ front 443(22 80 3389)
resource "aws_subnet" "front" {
  vpc_id     = var.vpc

cidr_block = "10.10.2.0/24"
 tags = {
    Name = "front"
  }
}


#____________________ security group
resource "aws_security_group" "allow_tls" {
  name        = "for_frontend"
  vpc_id      = var.vpc

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "0"
	cidr_blocks     = ["0.0.0.0/0"]

  }
  egress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "0"
	cidr_blocks     = ["10.10.2.0/24"]
  }
  # add prohibited ports
 }






 resource "aws_instance" "frontend" {

     availability_zone = var.availability_zone
     ami = var.ami
     instance_type               = "t2.micro"
     user_data              = <<EOF
#!/bin/bash
sudo su-
yum update -y
yum install httpd -y
myip =`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>ITA DevOps</h2><br>"  >  /var/www/html/index.html
service httpd start
chkconfig httpd on
EOF


     subnet_id                   = var.subnet_id_front
     vpc_security_group_ids      = ["sg-091b2b6f9be99f184"]

     root_block_device {
         volume_size = 8
         volume_type = "gp2"
     }


     lifecycle {
         create_before_destroy = true

         ignore_changes = ["vpc_security_group_ids", "root_block_device"]
     }

 }

#______________________________________________________________


resource "aws_instance" "services" {

    availability_zone = var.availability_zone
    ami = var.ami
    instance_type               = "t2.micro"

    subnet_id                   = var.subnet_id_serv
    vpc_security_group_ids      = ["sg-00c00666dbb8469fd"]

    root_block_device {
        volume_size = 8
        volume_type = "gp2"
    }


    lifecycle {
        create_before_destroy = true

        ignore_changes = ["vpc_security_group_ids", "root_block_device"]
    }

}
#______________________________________________________________

resource "aws_instance" "backend" {

    availability_zone = var.availability_zone
    ami = var.ami
    instance_type               = "t2.micro"

    subnet_id                   = var.subnet_id_back
    vpc_security_group_ids      = ["sg-00c00666dbb8469fd"]

    root_block_device {
        volume_size = 8
        volume_type = "gp2"
    }


    lifecycle {
        create_before_destroy = true

        ignore_changes = ["vpc_security_group_ids", "root_block_device"]
    }

}

























# resource "aws_instance" "dc" {
#     count = 3
#     availability_zone = var.availability_zone
#     ami = var.ami
#     instance_type               = "t2.micro"
#     user_data              = <<EOF
# #!/bin/bash
# sudo su-
# yum update -y
# yum install httpd -y
# myip =`curl http://169.254.169.254/latest/meta-data/local-ipv4`
# echo "<h2>ITA DevOps</h2><br>"  >  /var/www/html/index.html
# service httpd start
# chkconfig httpd on
# EOF
#
#
#     subnet_id                   = ["subnet-0308f3f997b4ef036", "subnet-043e4e8301b32d240", "subnet-0b7c4f901d58a50b9"]
#     vpc_security_group_ids      = ["sg-00c00666dbb8469fd", "sg-091b2b6f9be99f184","sg-00c00666dbb8469fd"]
#
#     root_block_device {
#         volume_size = 8
#         volume_type = "gp2"
#     }
#
#
#     lifecycle {
#         create_before_destroy = true
#
#         ignore_changes = ["vpc_security_group_ids", "root_block_device"]
#     }
#
# }
