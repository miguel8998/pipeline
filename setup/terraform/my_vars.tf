variable "cidr" {
  default = "0.0.0.0/0"
}

variable "elastic_ip" {
  default = "54.228.242.217"
}

variable "ami" {
  #default = "ami-0ed961fa828560210"  #amazon linux
  default = "ami-0b52fae86812df423"  #My ami
}

variable "box_size" {
  default = "t2.large"
}