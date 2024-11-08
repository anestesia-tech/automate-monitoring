resource "yandex_compute_instance" "srv_monitoring" {
  name = "monitoring"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-monitoring.id
  }

  network_interface {
    subnet_id = "${var.default-subnet-id}"
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

output "internal_ip_address_monitoring" {
  value = yandex_compute_instance.srv_monitoring.network_interface.0.ip_address
}

