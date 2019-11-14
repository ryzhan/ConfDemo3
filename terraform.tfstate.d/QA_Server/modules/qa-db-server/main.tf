resource "google_compute_instance" "qa-db-server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  tags = ["qa-db-server"]

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

resource "null_resource" "qa-db-server-prov" {
 
connection {
    type = "ssh"
    user = "jenkins"
    host = "${google_compute_instance.qa-db-server.network_interface.0.access_config.0.nat_ip}"
    private_key = "${file(var.private_key_path)}"
    agent = false   
  } 

  provisioner "file" {
    source      = "./modules/qa-db-server/qa-scenario_db.sh"
    destination = "/tmp/qa-scenario_db.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/qa-scenario_db.sh",
      "sudo /tmp/qa-scenario_db.sh"
    ]
  
  }

}