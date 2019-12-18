		resource "google_compute_instance" "app" {
                name = "reddit-app"
                machine_type = "g1-small"
                zone = "europe-west1-b"
		tags = ["reddit-app" , "http-server"]
                boot_disk {
                   initialize_params {
                     image = var.app_disk_image
        }
      }	

	      metadata = {
                block-project-ssh-keys = false
                ssh-keys = "appuser:file(var.public_key_patch)"
	}

	      network_interface {
                network = "default"
                access_config {
                nat_ip = google_compute_address.static.address
        }
       }
      }     
	      resource "google_compute_address" "static" {
                 name = "vm-public-address"
                }

        resource "google_compute_firewall" "firewall_puma" {
                name = "allow-puma-default"
                network = "default"
                allow {
                protocol = "tcp"
                ports = ["9292" , "80" , "443"]
        }
                source_ranges = ["0.0.0.0/0"]
                target_tags = ["reddit-app"]
        }
	
