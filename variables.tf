variable "aws_assumed_role_arn_hub" {
  type = string
  description = "Role ARN to assume for the Transit Gateway / hub account."
}

variable "aws_assumed_role_external_id_hub" {
  type = string
  default = null
  description = "IAM External ID for the Transit Gateway / hub account."
}

variable "aws_assumed_role_arn_spoke" {
  type = string
  description = "Role ARN to assume for the attachment account."
}

variable "aws_assumed_role_external_id_spoke" {
  type = string
  default = null
  description = "IAM External ID for the attachment account."
}

variable "region" {
  type = string
  default = "us-east-1"
  description = "Deployment region for the attachment."
}

variable "subnet_ids" {
  type = string
  description = "Subnet ID(s) for the attachment."
}

variable "gateway_id" {
  type = string
  description = "Transit Gateway ID."
}

variable "vpc_id" {
  type = string
  description = "VPC ID for the attachment."
}

variable "appliance_mode" {
  type = string
  default = "disable"
  description = "Whether to enable appliance mode for the attachment."
}

variable "dns_support" {
  type = string
  default = "enable"
  description = "Whether to enable DNS support for the attachment."
}

variable "ipv6_support" {
  type = string
  default = "disable"
  description = "Whether to enable IPv6 support for the attachment."
}

variable "associate_gateway_default_route_table" {
  type = bool
  default = false
  description = "Whether to automatically associate the attachment with the default Route Table."
}

variable "propagate_gateway_default_route_table" {
  type = bool
  default = false
  desscription = "Whether to automatically propagate the attachment to the default Route Table."
}

variable "blackhole" {
  type = bool
  default = false
  description = "Whether the attachment is a blackhole (drop all traffic)."
}

variable "hub_cidrs" {
  type = list
  description = "CIDR blocks for the Transit Gateway."
}

variable "spoke_cidrs" {
  type = list
  description = "CIDR blocks for the attachment."
}

variable "transit_gateway_route_table_id" {
  type = string
  description = "Route Table ID for the Transit Gateway."
}

variable "attachment_route_table_id" {
  type = string
  description = "Route Table ID for the attachment."
}
