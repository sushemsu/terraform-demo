terraform {
  backend "s3" {
    bucket = "sushemsu-bucket"
    key    = "application/core"
    region = "us-west-2"
  }
}
