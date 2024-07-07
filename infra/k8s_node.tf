data "yandex_compute_image" "almalinux" {
    family = "almalinux-9"
}

resource "yandex_compute_instance" "k8s_master" {
  count = 3
  name = "k8s-master-${count.index+1}"
  platform_id = var.vm_resources.all.instance_platform
  resources {
    cores = var.vm_resources.k8s_master.cores
    memory = var.vm_resources.k8s_master.memory
    core_fraction = var.vm_resources.k8s_master.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.almalinux.image_id
    }
  }
  scheduling_policy {
    preemptible = false
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat = true
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.vm_metadata.serial_port_enable    
  }

  allow_stopping_for_update = true
 
}

resource "yandex_compute_instance" "k8s_worker" {
  count = 2
  name = "k8s-worker-${count.index+1}"
  platform_id = var.vm_resources.all.instance_platform
  resources {
    cores = var.vm_resources.k8s_worker.cores
    memory = var.vm_resources.k8s_worker.memory
    core_fraction = var.vm_resources.k8s_worker.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.almalinux.image_id
    }
  }
  scheduling_policy {
    preemptible = false
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat = true
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.vm_metadata.serial_port_enable    
  }
  
  allow_stopping_for_update = true
 
}

data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
  vars = {
    username = local.ssh_username
    ssh_public_key = local.ssh_public_key
  }
}
