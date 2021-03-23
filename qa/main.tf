module "qa-vm" {
  source = "./modules/vm"
  count = var.num_instances
}

module "qa-firewall" {
  source = "./modules/firewall"
  networks = var.networks
}

module "qa-network" {
  source = "./modules/network"
  ports = var.list_ports
}