data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket = "sushemsu-bucket"
    key    = "application/core"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "sushemsu-bucket"
    key    = "application/eks"
    region = "us-west-2"
  }
}
