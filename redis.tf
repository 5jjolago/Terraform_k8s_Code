# resource "aws_elasticache_replication_group" "elasticache" {
#   replication_group_id        = local.elasticache_cluster_id
#   description                 = local.project
#   node_type                   = "cache.t3.small"
#   engine_version              = "7.0"
#   port                        = 6379
#   parameter_group_name        = "default.redis7.cluster.on"
#   automatic_failover_enabled  = true
#   multi_az_enabled            = true
#   subnet_group_name           = module.vpc.elasticache_subnet_group
#   security_group_ids          = [module.elasticache_sg.security_group_id]
#   preferred_cache_cluster_azs = local.azs
#   num_cache_clusters          = 3
#   at_rest_encryption_enabled  = true
#   transit_encryption_enabled  = true
#   user_group_ids              = [aws_elasticache_user_group.elasticache.id]

#   depends_on = [module.vpc]
# }
# ...