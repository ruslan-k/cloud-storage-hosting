resource "google_compute_global_address" "static_ip" {
  name = "${var.project_id}-ip"

  depends_on = [google_project_service.compute_engine_api]

}

resource "google_compute_target_http_proxy" "http_proxy" {
  name        = "${var.project_id}-http-proxy"
  url_map     = google_compute_url_map.cdn_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "http_rule" {
  name        = "${var.project_id}-http-rule"
  target      = google_compute_target_http_proxy.http_proxy.self_link
  ip_address  = google_compute_global_address.static_ip.address
  port_range  = "80"
}
