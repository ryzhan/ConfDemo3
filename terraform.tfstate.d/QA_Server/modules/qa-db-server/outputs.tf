output "network_ip_db_qa" {
  depends_on = ["null_resource.qa-db-server-prov"]
  value = "${google_compute_instance.qa-db-server.network_interface.0.network_ip}"
}

