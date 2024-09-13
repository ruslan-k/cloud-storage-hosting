resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.content_bucket.name

  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}