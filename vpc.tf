data "aws_availability_zones" "available" {}

resource "aws_vpc" "designing-distributed-systems" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = "${
    map(
     "Name", "terraform-eks",
     "kubernetes.io/cluster/${var.cluster-name}", "shared"
    )
  }"
}

resource "aws_subnet" "designing-distributed-systems" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.designing-distributed-systems.id}"

  tags = "${
    map(
     "Name", "terraform-eks-node",
     "kubernetes.io/cluster/${var.cluster-name}", "shared"
    )
  }"
}

resource "aws_internet_gateway" "designing-distributed-systems" {
  vpc_id = "${aws_vpc.designing-distributed-systems.id}"

  tags = {
    Name = "terraform-eks"
  }
}

resource "aws_route_table" "designing-distributed-systems" {
  vpc_id = "${aws_vpc.designing-distributed-systems.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.designing-distributed-systems.id}"
  }
}

resource "aws_route_table_association" "designing-distributed-systems" {
  count = 2

  subnet_id      = "${aws_subnet.designing-distributed-systems.*.id[count.index]}"
  route_table_id = "${aws_route_table.designing-distributed-systems.id}"
}