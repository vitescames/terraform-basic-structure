terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "escamezera"

    workspaces {
      name = "aws-escames"
    }
  }
}