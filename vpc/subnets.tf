data "aws_availability_zones" "available" {}

resource "aws_subnet" "private" {

  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.wearslot.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.wearslot.id

}

resource "aws_subnet" "public" {

  count                   = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.wearslot.cidr_block, 8, var.az_count + count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.wearslot.id
  map_public_ip_on_launch = true
}