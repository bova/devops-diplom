###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "K8S_NETWORK"
  description = "VPC network & subnet name"
}

variable "vm_image_family" {
    type = string
    default = "ubuntu-2004-lts"  
}

variable "nat_vm_image_id" {
    type = string
    default = "fd86aq92pnsig1u550jm"  
}

variable "vm_resources" {
  default = {
    "all" = {
      "instance_platform" = "standard-v1"
    }
    "k8s_master" = {
      "cores" = 2
      "memory" = 2
      "core_fraction" = 5
    }
    "k8s_worker" = {
      "cores" = 2
      "memory" = 2
      "core_fraction" = 20
    }
  }
}

###ssh vars

variable "vm_metadata" {
 default = {
   "serial_port_enable" = 1
   "user_name" = "vpovetkin"   
   "ssh_root_key"           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKZheAxIU8+Utegc2w/9fyRDl9wcRGFjokkcHVW/mMcB vpovetkin@v-povetkin-hp"    
 }
}