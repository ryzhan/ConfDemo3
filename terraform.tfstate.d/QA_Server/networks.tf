

resource "google_compute_firewall" "allow-qa-ssh" {
  name    = "ssh-firewall"
  network = var.network

  #depends_on = ["google_compute_network.my_network"]

  target_tags = ["qa-db-server","qa-app-server"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "qa-db-server" {
  name    = "db-server"
  network = var.network
  
  target_tags = ["qa-db-server"]

  allow {
    protocol = "tcp"
    ports    = ["27017","3306","27000"]
  }
  
}

resource "google_compute_firewall" "qa-app-server" {
  name    = "app-server"
  network = var.network

  target_tags = ["qa-app-server"]

  allow {
    protocol = "tcp"
    ports    = ["8081","8080","8082"]
  }

}

