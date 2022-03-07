data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket = "sushemsu-bucket"
    key    = "application/core"
    region = "us-west-2"
  }
}
