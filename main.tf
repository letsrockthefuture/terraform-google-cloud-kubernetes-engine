locals {
  project = var.project
  name    = var.name
  zone    = var.zone
}

resource "google_project_service" "container_googleapis" {
  project = local.project
  service = "container.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_service" "cloudresourcemanager_googleapis" {
  project = local.project
  service = "cloudresourcemanager.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_container_cluster" "cluster" {
  project  = local.project
  name     = "${local.name}-kubernetes-engine"
  location = local.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  provider = google-beta

  addons_config {
    istio_config {
      disabled = false
      auth     = "AUTH_NONE"
    }
  }

  network    = "${local.name}-vpc"
  subnetwork = "${local.name}-subnet"

  network_policy {
    enabled = true
  }

  depends_on = [
    google_project_service.container_googleapis,
    google_project_service.cloudresourcemanager_googleapis
  ]
}

#resource "google_container_node_pool" "general_node_pool" {
#  project    = local.project
#  name       = "${local.name}-general-node-pool"
#  location   = local.zone
#  cluster    = google_container_cluster.cluster.name
#  node_count = "1"
#
#  node_config {
#    oauth_scopes = [
#      "https://www.googleapis.com/auth/logging.write",
#      "https://www.googleapis.com/auth/monitoring",
#    ]
#
#  labels = {
#    env = local.project
#    app = "general"
#  }
#
#    preemptible  = true
#    machine_type = "n1-standard-1"
#    tags         = [ "kubernetes-engine-node", "${local.project}-kubernetes-engine", "general" ]
#    metadata = {
#      disable-legacy-endpoints = "true"
#    }
#  }
#
#  depends_on = [
#    google_project_service.container_googleapis,
#    google_project_service.cloudresourcemanager_googleapis
#  ]
#}

resource "google_container_node_pool" "cart_node_pool" {
  project    = local.project
  name       = "${local.name}-cart-node-pool"
  location   = local.zone
  cluster    = google_container_cluster.cluster.name
  node_count = "1"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  labels = {
    env = local.project
    app = "cart"
  }

    preemptible  = true
    machine_type = "n1-standard-1"
    tags         = [ "kubernetes-engine-node", "${local.project}-kubernetes-engine", "cart" ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  depends_on = [
    google_project_service.cloudresourcemanager_googleapis,
    google_project_service.container_googleapis
  ]
}

resource "google_container_node_pool" "checkout_node_pool" {
  project    = local.project
  name       = "${local.name}-checkout-node-pool"
  location   = local.zone
  cluster    = google_container_cluster.cluster.name
  node_count = "1"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  labels = {
    env = local.project
    app = "checkout"
  }

    preemptible  = true
    machine_type = "n1-standard-1"
    tags         = [ "kubernetes-engine-node", "${local.project}-kubernetes-engine", "checkout" ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  depends_on = [
    google_project_service.container_googleapis,
    google_project_service.cloudresourcemanager_googleapis
  ]
}
