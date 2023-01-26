# Hub account provider data.
provider "aws" {
  alias      = "hub"
  region     = var.region

  assume_role {
    role_arn     = var.aws_assumed_role_arn_hub
    session_name = "terraform-cross-account"
    external_id  = var.aws_assumed_role_external_id_hub
  }
}

# Spoke-account provider data.
provider "aws" {
  alias      = "spoke"
  region     = var.region

  assume_role {
    role_arn     = var.aws_assumed_role_arn_spoke
    session_name = "terraform-cross-account"
    external_id  = var.aws_assumed_role_external_id_spoke
  }
}
