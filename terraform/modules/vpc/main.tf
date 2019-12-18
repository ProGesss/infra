	   resource "google_compute_firewall" "firewall_ssh" {
	    name = "default-allow-ssh"
            network = "default"

		connection {
                type = "ssh"
                user = "appuser"
                agent = false
                private_key = file("${var.private_key_path}")
                host = google_compute_address.static.address
        }
    

            allow {
              protocol = "tcp"
              ports = ["22"]
            }
            source_ranges = var.source_ranges
      }
