resource "aws_vpc" "ozzorago_vpc" {
    cidr_block = "10.100.0.0/16"
    tags = {
        "Name" = "ozzorago_vpc_${var.env}"
    }
}  


resource "aws_subnet" "public-sn-1" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.0.0/24"
    availability_zone = local.az_a
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "public-sn-1_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "public-sn-2" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.10.0/24"
    availability_zone = local.az_b
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "public-sn-1_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "public-sn-3" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.20.0/24"
    availability_zone = local.az_c
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "public-sn-1_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-sn-1" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.1.0/24"
    availability_zone = local.az_a
    tags = {
      "Name" = "private-sn-1_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-sn-2" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.11.0/24"
    availability_zone = local.az_b
    tags = {
      "Name" = "private-sn-2_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-sn-3" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.21.0/24"
    availability_zone = local.az_c
    tags = {
      "Name" = "private-sn-1_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-sn-4" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.31.0/24"
    availability_zone = local.az_a
    tags = {
      "Name" = "private-sn-2_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-sn-5" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.41.0/24"
    availability_zone = local.az_b
    tags = {
      "Name" = "private-sn-1_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-sn-6" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    cidr_block = "10.100.51.0/24"
    availability_zone = local.az_c
    tags = {
      "Name" = "private-sn-2_${var.env}"
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }
}
