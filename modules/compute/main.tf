resource "google_compute_instance" "servers-east" {
  count        = "${var.servers_count}"
  name         = "server-east-${count.index + 1}"
  machine_type = "${var.server_machine_type}"
  zone         = "${data.google_compute_zones.east-azs.names[count.index]}"

  tags = [
    "consul-server",
    "consul-east-dc"
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "${data.google_compute_network.east-network.self_link}"

    access_config {
      // ephemeral public IP
    }
  }

  metadata {
    sshKeys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}