######
# VPC
######
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-vpc"
    }
  )
}

##########
# Subnet 1
##########
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.sub_1_cidr
  availability_zone       = var.sub_1_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-sub_1"
    }
  )
}

##########
# Subnet 2
##########
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.sub_2_cidr
  availability_zone       = var.sub_2_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-sub_2"
    }
  )
}

##################
# Internet Gateway
##################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-igw"
    }
  )
}

#############
# Route Table
#############
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.igw_route
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-rt"
    }
  )
}

##################################
# Route Table Association Subnet 1
##################################
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

##################################
# Route Table Association Subnet 2
##################################
resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}
