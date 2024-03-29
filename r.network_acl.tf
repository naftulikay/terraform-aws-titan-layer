# Titan Layer Module - Network ACL Resources

# Network ACL Shared by All Subnets in the Layer
resource aws_network_acl default {
  vpc_id = var.vpc_id
  subnet_ids = [for subnet in aws_subnet.default : subnet.id]

  # tags
  tags = merge({ Name = "${var.name}.${var.zone}" }, local.resource_tags)
}

# Default Ingress Rule: Allow All (Override by Lower Priority Rule)
resource aws_network_acl_rule ingress {
  network_acl_id = aws_network_acl.default.id

  egress = false
  rule_number = 1000
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}

resource aws_network_acl_rule ingress_ipv6 {
  network_acl_id = aws_network_acl.default.id

  egress = false
  rule_number = 1001
  protocol = "all"
  rule_action = "allow"
  ipv6_cidr_block = "::/0"
}

# Default Egress Rule: Allow All (Override by Lower Priority Rule)
resource aws_network_acl_rule egress {
  network_acl_id = aws_network_acl.default.id

  egress = true
  rule_number = 1000
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}

resource aws_network_acl_rule egress_ipv6 {
  network_acl_id = aws_network_acl.default.id

  egress = true
  rule_number = 1001
  protocol = "all"
  rule_action = "allow"
  ipv6_cidr_block = "::/0"
}
