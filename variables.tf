variable "project" {
  type        = string
  description = "Project name from Google Cloud."
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `dev`, `staging`, `prd`)."
  default     = "dev"
}

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)."
  default     = "hash-challenge"
}

variable "zone" {
  type        = string
  description = "Locate based on Google Cloud region to provisioning our resources (e.g. `us-east1-b`)."
  default     = "us-east1-b"
}
