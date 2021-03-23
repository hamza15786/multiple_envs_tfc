module "prod-vm" {
  source = "./modules/vm"
  count = var.num_instances
}

module "prod-firewall" {
  source = "./modules/firewall"
  networks = var.networks
}

module "prod-network" {
  source = "./modules/network"
  ports = var.list_ports
}