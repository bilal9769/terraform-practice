module "resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-bcsla-dev"
  location = var.location
  tags = {
    bcsla_code        = var.bcsla_code
    application_owner = var.application_owner
  }
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = module.resource_group.name
  location            = var.location
}

module "compute" {
  source              = "../../modules/compute"
  resource_group_name = module.resource_group.name
  location            = var.location
  subnet_id           = module.network.subnet_1_id

  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
}

module "storage" {
  source              = "../../modules/storage"
  resource_group_name = module.resource_group.name
  location            = var.location
  subnet_id           = module.network.subnet_2_id
}
