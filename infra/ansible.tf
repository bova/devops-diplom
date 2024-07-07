resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/inventory_hosts.tftpl",

    { k8s_masters =  yandex_compute_instance.k8s_master, k8s_workers = yandex_compute_instance.k8s_worker}  )

  # filename = "${abspath(path.module)}/hosts.cfg"
  filename = "/home/vpovetkin/kubespray/inventory/mycluster/k8s_inventory.ini"
  
  lifecycle {
    replace_triggered_by = [
      yandex_compute_instance.k8s_master, yandex_compute_instance.k8s_worker
    ]
  }
}