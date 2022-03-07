terraform {
  backend "s3" {
    bucket = "sushemsu-bucket"
    key    = "application/db"
    region = "us-west-2"
  }
}
