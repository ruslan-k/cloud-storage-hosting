resource "google_compute_backend_bucket" "cdn_backend" {
  name        = "${var.project_id}-backend"
  bucket_name = google_storage_bucket.content_bucket.name
  enable_cdn  = true

  depends_on = [google_project_service.compute_engine_api]
}

resource "google_compute_url_map" "cdn_url_map" {
  name            = "${var.project_id}-url-map"
  default_service = google_compute_backend_bucket.cdn_backend.self_link
}