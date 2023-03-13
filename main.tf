resource "google_storage_bucket" "static-site" {
  name          = "git-tera-gcp-site"
  location      = "EU"

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
resource "google_storage_bucket_object" "picture" {
  name = "favicon.ico"
  source = "public/favicon.ico"
  bucket = "git-tera-gcp-site"
}
resource "google_storage_bucket_object" "static" {
  name   = "index.html"
  source = "public/index.html"
  bucket = "git-tera-gcp-site"
}
# making the index.html file public
resource "google_storage_default_object_access_control" "public_rule" {
  bucket = "git-tera-gcp-site"
  role   = "READER"
  entity = "allUsers"
}