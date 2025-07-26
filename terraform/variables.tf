###cloud vars
variable "ssh_key" {
  description = "SSH public key for login access."
  type        = string
}

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

variable "bucket_name" {
  type        = string
  default     = "ft-state"
  description = "VPC network&subnet name"
}

variable "account_name" {
  type        = string
  default     = "service"
  description = "VPC network&subnet name"
}

variable "network_name" {
  description = "Name of VPC network."
  type        = string
  default     = "default"
}

variable "subnet_name" {
  description = "Name of Subnet within the VPC network."
  type        = string
  default     = "default-ru-central1-a"
}

variable "image_id" {
  description = "ID образа для запуска ВМ"
  type        = string
  default     = "fd8bv1vdr0alvbbeq6ej" 
}
