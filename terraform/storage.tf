resource "google_storage_bucket" "content_bucket" {
  name     = "${var.project_id}-content-bucket"
  location = var.region

  website {
    main_page_suffix = "index.html"
  }

  uniform_bucket_level_access = true

  depends_on = [google_project_service.storage_api]

}

resource "google_storage_bucket_object" "index" {
  name   = "index.html"
  bucket = google_storage_bucket.content_bucket.name
  source = "./files/index.html"
  content_type = "text/html"
}