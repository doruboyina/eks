provider "google" {
 credentials = file("~/Downloads/filename.json")
 project     = "<project-id>"
 region      = "us-central1-a"
}

resource "google_container_cluster" "appcluster" {
    name = "appcluster"
    location = "us-central1-a"
    remove_default_node_pool = true
    initial_node_count = 1
    network  = "default"
    subnetwork = "default"
    networking_mode = "VPC_NATIVE"
    project = "<project-id"

    node_locations = [
        "us-central1-b"
    ]

    release_channel {
        channel = "REGULAR"
    }

    workload_identity_config {
        workload_pool = "<svc-id>.svc.id.goog"
    }

    ip_allocation_policy {
        cluster_secondary_range_name = "k8-pod-range"
        services_secondary_range_name = "k8s-service-range"
    }

    private_cluster_config {
        enable_private_nodes = true
        enable_private_endpoint = false
        master_ipv4_cidr_block = "10.128.0.0/28"
    }
}
