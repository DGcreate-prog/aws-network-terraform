Terraform
# 1. Configuração da Nuvem (AWS)
provider "aws" {
  region = "us-east-1"
}

# 2. Criação da Rede Principal (VPC)
resource "aws_vpc" "minha_rede" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Rede-Principal-Outlier"
  }
}

# 3. Criação de uma Sub-rede Pública (Acesso à Internet)
resource "aws_subnet" "publica" {
  vpc_id     = aws_vpc.minha_rede.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Sub-rede-Publica"
  }
}

# 4. Criação de uma Sub-rede Privada (Isolada, para segurança)
resource "aws_subnet" "privada" {
  vpc_id     = aws_vpc.minha_rede.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Sub-rede-Privada"
  }
}
