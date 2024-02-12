data "aws_security_group" "sg-ssh" {
  name = "ozzorago-sg-ssh"
}


resource "aws_ec2_instance_connect_endpoint" "test_eic" {
    subnet_id = aws_subnet.private-sn-1.id
    security_group_ids = [data.aws_security_group.sg-ssh.id]
    preserve_client_ip = true

    tags = {
        Name = "eic-test"
    }
}
# aws ec2-instance-connect ssh --instance-id [인스턴스 id] --connection-type eice