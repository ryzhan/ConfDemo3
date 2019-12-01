output "network_ip_elk" {
  depends_on = ["null_resource.elk-prov"]
  value = "${google_compute_instance.elk.network_interface.0.network_ip}"
}