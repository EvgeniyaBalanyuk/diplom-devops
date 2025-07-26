resource "yandex_vpc_network" "project" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "project-subnet1" {
  name           = var.subnet1
  zone           = var.zone1
  network_id     = yandex_vpc_network.project.id
  v4_cidr_blocks = var.cidr1
}

resource "yandex_vpc_subnet" "project-subnet2" {
  name           = var.subnet2
  zone           = var.zone2
  network_id     = yandex_vpc_network.project.id
  v4_cidr_blocks = var.cidr2
}

variable "zone1" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone2" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cidr1" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "cidr2" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "project"
  description = "VPC network&subnet name"
}

variable "subnet1" {
  type        = string
  default     = "project-subnet1"
  description = "subnet name"
}

variable "subnet2" {
  type        = string
  default     = "project-subnet2"
  description = "subnet name"
}