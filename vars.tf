variable "amis" {
  type = map
  default = {
    "ami-east1" = "ami-090fa75af13c156b4",
    "ami-east2" = "ami-0568773882d492fc8"
  }
}

variable "cdirs_acessos" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "key_name" {
  default = "terraform"
}