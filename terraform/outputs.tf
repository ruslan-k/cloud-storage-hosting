output "bucket_url" {
  value = "gs://${google_storage_bucket.content_bucket.name}"
}

output "bucket_name" {
  value = google_storage_bucket.content_bucket.name
}

output "lb_ip" {
  value = google_compute_global_forwarding_rule.http_rule.ip_address
}