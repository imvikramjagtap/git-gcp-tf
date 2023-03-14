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
resource "google_storage_bucket_object" "static" {
  name   = "index1.html"
  source = "public/index1.html"
  bucket = "git-tera-gcp-site"
}
# making the index.html file public
resource "google_storage_default_object_access_control" "public_rule" {
  bucket = "git-tera-gcp-site"
  role   = "READER"
  entity = "allUsers"
}