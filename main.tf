provider "google" {
	credentials = " ${file("service-account.json")}"
	project	="rbuild0"
	name	="rbuildvm"
	machine_type	="f1-micro"

	boot_disk	{
		initialize_params  {
			image="debian-cloud/debian-9"
		}
	}

	
	network_interface {

	network=" "${google_compute_network.vpc_network_network.self_link}"
	access_config = {
	}
	}
	}
