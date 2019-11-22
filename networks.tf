

resource "google_compute_firewall" "allow-ssh" {
  name    = "ssh-firewall"
  network = var.network

  #depends_on = ["google_compute_network.my_network"]

  target_tags = ["db-server","app-server"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "db-server" {
  name    = "db-server"
  network = var.network
  
  target_tags = ["db-server"]

  allow {
    protocol = "tcp"
    ports    = ["27017","3306","27000"]
  }
  
}

resource "google_compute_firewall" "app-server" {
  name    = "app-server"
  network = var.network

  target_tags = ["app-server"]

  allow {
    protocol = "tcp"
    ports    = ["8081","8080","8082"]
  }

}

resource "google_compute_firewall" "elk" {
  name    = "elk"
  network = var.network

  target_tags = ["elk"]

  allow {
    protocol = "tcp"
    ports    = ["5601","9200","9300"]
  }

}
