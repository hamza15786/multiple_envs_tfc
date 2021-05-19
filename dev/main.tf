module "dev-compute" {
  source = "./multiple_envs_tfc/modules/compute"
  count = var.num_instances
}

module "dev-firewall" {
  source = "./multiple_envs_tfc/modules/firewall"
  networks = var.networks
}

module "dev-network" {
  source = "./multiple_envs_tfc/modules/network"
  ports = var.list_ports
}
