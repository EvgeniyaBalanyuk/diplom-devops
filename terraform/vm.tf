resource "yandex_compute_instance" "k8s_node" {
  count       = 3
  name        = element(["master", "worker1", "worker2"], count.index)
  platform_id = "standard-v1"

  zone = element([var.zone1, var.zone2, var.zone1], count.index)

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 30
    }
  }

  network_interface {
    subnet_id = element([
      yandex_vpc_subnet.project-subnet1.id,
      yandex_vpc_subnet.project-subnet2.id,
      yandex_vpc_subnet.project-subnet1.id
    ], count.index)
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}
