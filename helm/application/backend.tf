terraform {
  backend "s3" {
    bucket = "sushemsu-bucket"
    key    = "application/helm/application"
    region = "us-west-2"
  }
}
