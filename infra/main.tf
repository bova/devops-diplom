## K8S Network
resource "yandex_vpc_network" "K8S_NETWORK" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.K8S_NETWORK.id
  v4_cidr_blocks = ["192.168.11.0/24"]
}
