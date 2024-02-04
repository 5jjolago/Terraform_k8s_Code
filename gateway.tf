resource "aws_internet_gateway" "ozzogaro-ig" {
    vpc_id = aws_vpc.ozzorago_vpc.id
    tags = {
      "Name" = "ozzogaro-ig_${var.env}"
    }
  
}
resource "aws_eip" "ozzorago-eip" { 
    tags = {
      "Name" = "ozzogaro-eip_${var.env}"
    }
}
resource "aws_nat_gateway" "ozzorago-nat" {
    allocation_id = aws_eip.ozzorago-eip.id
    subnet_id = aws_subnet.public-sn-1.id
    tags = {
      "Name" = "ozzogaro-nat_${var.env}"
    }
}

