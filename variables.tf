# Titan Layer Module - Variables

variable addtl_tags {
  type = map(string)
  default = {}

  description = <<-EOF
    Additional tags to apply to resources.
  EOF
}

variable availability_zones {
  type = list(string)

  description = <<-EOF
    A list of availability zones to distribute subnets along.
  EOF
}

variable is_public {
  type = bool
  default = false

  description = <<-EOF
    Does this layer face WAN, or is it private?

    Default: false.
  EOF
}

variable name {
  type = string
  description = <<-EOF
    The name of this Titan layer.
  EOF
}

variable network_name {
  type = string
  description = <<-EOF
    The name of the Titan Network to which this layer belongs.
  EOF
}

variable vpc_id {
  type = string
  description = <<-EOF
    The VPC id of the Titan network owning this Titan layer.
  EOF
}

variable zone {
  type = string
  description = <<-EOF
    The hosted zone of the Titan Network to which this layer belongs.
  EOF
}
