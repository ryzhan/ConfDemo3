output "network_ip_app_qa" {
  depends_on = ["null_resource.qa-app-server-prov"]
  value = "${google_compute_instance.qa-app-server.network_interface.0.network_ip}"
}