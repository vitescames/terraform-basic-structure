resource "aws_security_group" "acesso" {
  description = "SG de acesso a ec2"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_acessos # O IP que a gente quer liberar acesso
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-2" {
  description = "SG de acesso a ec2"
  provider = aws.east2 # Vai criar no provider com esse alias

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_acessos # O IP que a gente quer liberar acesso
  }
  tags = {
    Name = "ssh-2"
  }
}