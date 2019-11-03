output "network_ip_app" {
  depends_on = ["null_resource.app-demo2-prov"]
  value = "${google_compute_instance.app-server.network_interface.0.network_ip}"
}