resource "aws_ec2_transit_gateway_route" "route_to_hub" {
  provider = "spoke"

  for_each = var.hub_cidrs
  destination_cidr_block         = each.key
  blackhole = var.blackhome
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = var.attachment_route_table_id
}

resource "aws_ec2_transit_gateway_route" "route_to_spoke" {
  provider = "hub"

  for_each = var.spoke_cidrs
  destination_cidr_block         = each.key
  blackhole = var.blackhome
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}

resource "aws_ec2_transit_gateway_route_table_association" "association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "propagation" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}
