module "dev-compute" {
  source = "./modules/compute"
  count = var.num_instances
}

module "dev-firewall" {
  source = "./modules/firewall"
  networks = var.networks
}

module "dev-network" {
  source = "./modules/network"
  ports = var.list_ports
}
