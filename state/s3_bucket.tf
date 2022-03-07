resource "aws_s3_bucket" "state" {
  bucket        = var.state_bucket
  force_destroy = var.state_force_destroy
  acl           = var.state_acl
  tags = {
    Owner       = var.owner
    Environment = var.state_environ
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket                  = aws_s3_bucket.state.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
