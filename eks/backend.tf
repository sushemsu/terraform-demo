terraform {
  backend "s3" {
    bucket = "sushemsu-bucket"
    key    = "application/eks"
    region = "us-west-2"
  }
}
