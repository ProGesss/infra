	provider "google" {
		project = var.project
		region = var.region
	}
	resource "google_compute_instance" "app" {
		name = "reddit-app"
		machine_type = "g1-small"
		zone = "europe-west1-b"

		boot_disk {
		initialize_params {
		image = var.disk_image
	}
      }


		metadata = {
		block-project-ssh-keys = false
                ssh-keys = "appuser:file(var.public_key_patch)"
        }
		tags = ["reddit-app" , "http-server" , "https-server"]
	

	network_interface {
	   	network = "default"
		access_config {
		nat_ip = google_compute_address.static.address
	}

	}

   	connection {
    		type = "ssh"
   		user = "appuser"
    		agent = false
    		private_key = "file(var.private_key_path)"
		host = google_compute_address.static.address
 	}
		provisioner "file" {
    		source = "files/puma.service"
    		destination = "/tmp/puma.service"
 	}
		provisioner "remote-exec" {
		script = "files/deploy.sh"
        }
    }

		resource "google_compute_address" "static" {
 		 name = "vm-public-address"
		}

	resource "google_compute_firewall" "firewall_puma" {
                name = "allow-puma-default"
                # Название сети, в которой действует правило
                network = "default"
                # Какой доступ разрешить
                allow {
                protocol = "tcp"
                ports = ["9292" , "80" , "443"]
        }
                # Каким адресам разрешаем доступ
                source_ranges = ["0.0.0.0/0"]
                # Правило применимо для инстансов с тегом …
                target_tags = ["reddit-app"]
        }
