##### default security group ######
resource "aws_default_security_group" "ozzorago-default" {
  vpc_id = aws_vpc.ozzorago_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}


### TCP 22#####
resource "aws_security_group" "ozzorago-sg-ssh" {
    name = "ozzorago-sg-ssh"
    vpc_id = aws_vpc.ozzorago_vpc.id
    description = "for ssh"
    tags = {
        "Name" = "ozzorago-sg-ssh"
    }

}
resource "aws_security_group_rule" "ozzorago-sg-ssh-ingress-role" {   # 인바운드
    security_group_id = aws_security_group.ozzorago-sg-ssh.id
    type = "ingress"
    description = "allow ssh"
    to_port = 22
    protocol = "tcp"
    from_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]

}

resource "aws_vpc_security_group_egress_rule" "ozzorago-sg-ssh-egress-role" {  #아웃바운드
    security_group_id = aws_security_group.ozzorago-sg-ssh.id
    description = "allow all outbound"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}
### TCP 80, 443 #####
resource "aws_security_group" "ozzorago-sg-http-https" {
    name = "ozzorago-sg-http-https"
    vpc_id = aws_vpc.ozzorago_vpc.id
    description = "for HTTP,HTTPS"
    tags = {
        "Name" = "ozzorago-sg-http-https"
    }

}
resource "aws_vpc_security_group_ingress_rule" "ozzorago-sg-http-ingress-role" {
    security_group_id = aws_security_group.ozzorago-sg-http-https.id
    description = "allow http inbound"
    ip_protocol = "tcp"
    to_port = 80
    from_port = 80
    cidr_ipv4 = "0.0.0.0/0"

}
resource "aws_vpc_security_group_ingress_rule" "ozzorago-sg-https-ingress-role" {
    security_group_id = aws_security_group.ozzorago-sg-http-https.id
    description = "allow https inbound"
    ip_protocol = "tcp"
    to_port = 443
    from_port = 443
    cidr_ipv4 = "0.0.0.0/0"     
}

resource "aws_vpc_security_group_egress_rule" "ozzorago-sg-http-https-egress-role" {  #아웃바운드
    security_group_id = aws_security_group.ozzorago-sg-http-https.id
    description = "allow all outbound"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}


###### eks sg ########

resource "aws_security_group" "ozzorago-eks-sg" {
    name = "ozzorago-eks-sg"
    description = "for eks"
    vpc_id = aws_vpc.ozzorago_vpc.id
    tags = {
      "Name" = "ozzorago-eks-sg"
    }
}
resource "aws_vpc_security_group_ingress_rule" "eks-sg-ingress" {
    security_group_id = aws_security_group.ozzorago-eks-sg.id
    description = "allow for esk"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}
resource "aws_vpc_security_group_egress_rule" "eks-sg-egress" {
    security_group_id = aws_security_group.ozzorago-eks-sg.id
    description = "allow for esk"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
}