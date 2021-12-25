# Titan Layer Module

locals {
  resource_tags = merge(
    {
      titan_layer = var.name,
      titan_network = var.network_name,
      titan_zone = var.zone,
    },
    var.addtl_tags,
  )
}