# Private module published in TFC from GitHub repo
module "private-null" {
  source  = "app.terraform.io/vivien-paid-org/private-null/hashicorp"
  version = "1.0.0"
}

# Private module published in TFC from Azure repo
module "private-null2" {
  source  = "app.terraform.io/vivien-paid-org/private-null2/hashicorp"
  version = "1.0.0"
}
