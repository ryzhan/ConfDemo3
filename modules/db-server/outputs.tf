output "network_ip_db" {
  depends_on = ["null_resource.db-server-prov"]
  value = "${google_compute_instance.db-server.network_interface.0.network_ip}"
}

