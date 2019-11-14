resource "google_compute_instance" "qa-app-server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone = var.zone

  tags = ["qa-app-server","http-server"]

  metadata = {
   #ssh-keys = "${var.user_name}:${file(var.public_key_path["${var.user_name}"])}"
   ssh-keys = "${var.user_name}:${file(var.public_key_path)}"
  }

  metadata_startup_script = ""

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network = var.network
    network_ip = var.network_ip
    access_config {
    }
  }
  
}

resource "null_resource" "qa-app-server-prov" {
 
connection {
    type = "ssh"
    user = "jenkins"
    host = "${google_compute_instance.qa-app-server.network_interface.0.access_config.0.nat_ip}"
    private_key = "${file(var.private_key_path)}"
    agent = false   
  }

  provisioner "file" {
    source      = "./modules/qa-app-server/qa-scenario_app.sh"
    destination = "~/qa-scenario_app.sh"

  }
  
  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/qa-scenario_app.sh",
      "sudo ~/qa-scenario_app.sh "
    ]
  
  }

}




