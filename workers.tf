
resource "google_container_node_pool" "general" {
    name = "general"
    cluster = google_container_cluster.appcluster.id
    project = "<project-id>"
    node_count = 2
    management {
      auto_repair = true
      auto_upgrade = true
    }
    node_config {
      preemptible = false
      machine_type = "e2-small"
      service_account = "gke-project@<project-id>.iam.gserviceaccount.com"
      oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    }

}

