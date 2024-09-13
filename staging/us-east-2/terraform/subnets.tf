#####################  Public Subnets  ########################
resource "aws_subnet" "staging_public_subnet_1" {
  vpc_id                  = aws_vpc.staging.id
  cidr_block              = "10.35.10.0/24"
  availability_zone       = var.use2a
  map_public_ip_on_launch = true

  tags = {
    Name = "staging_public_subnet_1"
  }
}

resource "aws_subnet" "staging_public_subnet_2" {
  vpc_id                  = aws_vpc.staging.id
  cidr_block              = "10.35.20.0/24"
  availability_zone       = var.use2b
  map_public_ip_on_launch = true

  tags = {
    Name = "staging_public_subnet_2"
  }
}
##################### Private Subnets #######################

resource "aws_subnet" "staging_private_subnet_1" {
  vpc_id            = aws_vpc.staging.id
  cidr_block        = "10.35.30.0/24"
  availability_zone = var.use2a

  tags = {
    Name = "staging_private_subnet_1"
  }
}

resource "aws_subnet" "staging_private_subnet_2" {
  vpc_id            = aws_vpc.staging.id
  cidr_block        = "10.35.40.0/24"
  availability_zone = var.use2b

  tags = {
    Name = "staging_private_subnet_2"
  }
}