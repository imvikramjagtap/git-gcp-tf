resource "google_storage_bucket" "static-site" {
  name          = "git-tera-gcp-site"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://git-tera-gcp.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}
# Adding file to bucket
resource "google_storage_bucket_object" "static_site_src" {
  name   = "index.html"
  source = "public/index.html"
  bucket = google_storage_bucket.git-tera-gcp-site
}
# making the index.html file public
resource "google_storage_default_object_access_control" "public_rule" {
  bucket = google_storage_bucket.git-tera-gcp-site
  role   = "READER"
  entity = "allUsers"
}