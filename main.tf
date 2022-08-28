provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias = "east2"
    region = "us-east-2"
}

resource "aws_instance" "dev" {
    count = 3
    ami = var.amis["ami-east1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
      Name = "dev${count.index}"
    }
    vpc_security_group_ids = [aws_security_group.acesso.id]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "terra-dev4"
}

resource "aws_instance" "dev4" {
    ami = var.amis["ami-east1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
      Name = "dev4-instancia"
    }
    vpc_security_group_ids = [aws_security_group.acesso.id]
    depends_on = [aws_s3_bucket.dev4] # Só cria a instancia apos o bucket estar criado, atrela os recursos
}

resource "aws_instance" "dev5" {
    provider = aws.east2
    ami = var.amis["ami-east2"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
      Name = "dev5-instancia"
    }
    vpc_security_group_ids = [aws_security_group.acesso-2.id]
    depends_on = [aws_dynamodb_table.db-homol]
}

resource "aws_dynamodb_table" "db-homol" {
    provider = aws.east2
    name           = "GameScores"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "UserId"
    range_key      = "GameTitle"

    attribute {
        name = "UserId"
        type = "S"
    }

    attribute {
        name = "GameTitle"
        type = "S"
    }
}