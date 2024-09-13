resource "google_dns_managed_zone" "dns_zone" {
  name        = "dns-zone"
  dns_name    = var.domain_name

  depends_on = [google_project_service.cloud_dns_api, google_project_service.compute_engine_api]

}

resource "google_dns_record_set" "bucket_hosting_dns_record" {
  name         = var.domain_name
  managed_zone = google_dns_managed_zone.dns_zone.name
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_global_address.static_ip.address]
}
