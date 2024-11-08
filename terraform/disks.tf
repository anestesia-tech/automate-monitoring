resource "yandex_compute_image" "debian_11" {
  source_family = "debian-11"
}

resource "yandex_compute_disk" "boot-disk-monitoring" {
  name = "monitoring-bootdisk"
  type = "network-hdd"
  zone = "${var.default-zone}"
  size     = "20"
  image_id = yandex_compute_image.debian_11.id
}

