output "project" {
  value       = local.project
  description = "The project where the cloud endpoint was created."
}

output "kubernetes_engine_cluster_name" {
  value       = google_container_cluster.cluster.name
  description = "Kubernetes Engine cluster name."
}
