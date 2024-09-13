variable "project_id" {
  type = string
  description = "The ID of the GCP project."
}

variable "region" {
  type = string
  default = "us-central1"
  description = "The region to deploy resources."
}

variable "domain_name" {
  type = string
  description = "The domain for the site."
}