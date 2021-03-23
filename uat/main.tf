module "uat-vm" {
  source = "./modules/vm"
  count = var.num_instances
}

module "uat-firewall" {
  source = "./modules/firewall"
  networks = var.networks
}

module "uat-network" {
  source = "./modules/network"
  ports = var.list_ports
}