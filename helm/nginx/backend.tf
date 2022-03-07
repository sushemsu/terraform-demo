terraform {
  backend "s3" {
    bucket = "sushemsu-bucket"
    key    = "application/helm/nginx"
    region = "us-west-2"
  }
}
