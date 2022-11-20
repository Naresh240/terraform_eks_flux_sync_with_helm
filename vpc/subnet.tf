data "aws_availability_zones" "available" {}

locals {
  az_count  = length(data.aws_availability_zones.available.names)
  subnet_bits = local.az_count * var.subnet_count
}
# Public Subnets
resource "aws_subnet" "public" {
  count = var.subnet_count

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, local.subnet_bits, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                           = "${var.project}-public-sg"
    "kubernetes.io/cluster/${var.project}-cluster" = "shared"
    "kubernetes.io/role/elb"                       = 1
  }
  map_public_ip_on_launch = true
  depends_on  = [aws_vpc.this]
}

# Private Subnets
resource "aws_subnet" "private" {
  count = var.subnet_count

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, local.subnet_bits, count.index + var.subnet_count)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                           = "${var.project}-private-sg"
    "kubernetes.io/cluster/${var.project}-cluster" = "shared"
    "kubernetes.io/role/internal-elb"              = 1
  }
  depends_on  = [aws_vpc.this]  
}