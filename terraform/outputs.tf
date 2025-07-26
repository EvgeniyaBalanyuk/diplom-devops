output "k8s_public_ips" {
  value = yandex_compute_instance.k8s_node[*].network_interface[0].nat_ip_address
}
