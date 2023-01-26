resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  provider = "spoke"

  subnet_ids         = var.subnet_ids
  transit_gateway_id = var.gateway_id
  vpc_id             = var.vpc_id
  appliance_mode_support= var.appliance_mode
  dns_support = var.dns_support
  ipv6_support = var.ipv6_support
  transit_gateway_default_route_table_association = null
  transit_gateway_default_route_table_propagation = null
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "vpc_attachment_accepter" {
  provider = "hub"

  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_default_route_table_association = var.associate_gateway_default_route_table
  transit_gateway_default_route_table_propagation = var.propagate_gateway_default_route_table
}
