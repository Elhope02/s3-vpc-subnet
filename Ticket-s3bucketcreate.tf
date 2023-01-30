#Create s3 

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_s3_bucket" "bkt" {
  bucket = "bootcamp29-10001-edward"
    acl = "private"
    versioning {
        enabled = true
    }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.bkt.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}


