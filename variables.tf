variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-east-2"
}
variable "vpc" {
 default = "vpc-0f49df3a9633bb868"
 }
variable "excluded_ports" {
default = [22,80,3389]
 }
 variable "inst_name" {
default = ["services","front","back"]
 }
 variable "subid" {
default = ["subnet-0308f3f997b4ef036", "subnet-043e4e8301b32d240", "subnet-0b7c4f901d58a50b9"]
 }
 variable "ami" {
# type    = list(string)
default = "ami-0c55b159cbfafe1f0"
 }
 variable "security_groups" {
#   type    = list(string)
default = "sg-091b2b6f9be99f184"
 }

 variable "subnet_id_front" {
#   type    = list(string)
default = "subnet-043e4e8301b32d240"
 }

 variable "subnet_id_serv" {
 #   type    = list(string)
 default = "subnet-0308f3f997b4ef036"
 }

 variable "subnet_id_back" {
 #   type    = list(string)
 default = "subnet-0b7c4f901d58a50b9"
 }




 variable "availability_zone" {
#   type    = list(string)
default = "us-east-2b"
 }
