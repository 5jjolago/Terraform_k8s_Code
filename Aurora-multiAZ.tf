

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  master_username         = "foo"
  master_password         = "asd990526!"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  availability_zones      = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}
resource "aws_rds_cluster_instance" "cluster_instances" {
  count               = 2
  identifier          = "aurora-cluster-demo-${count.index}"
  cluster_identifier  = aws_rds_cluster.default.id
  instance_class      = "db.t3.medium"  # 인스턴스 클래스 변경 (예시)
  engine              = "aurora-mysql"
  engine_version      = "8.0.mysql_aurora.3.04.1"  # 클러스터와 일치하는 엔진 버전으로 변경
  db_subnet_group_name =  aws_rds_cluster.default.db_subnet_group_name
  publicly_accessible = false
}
