terraform {
  backend "s3" {
    bucket       = "mounikola-devops-tfstate-2026-1117"
    key          = "s3-static-website/terraform.tfstate"
    region       = "ap-southeast-2"
    encrypt      = true
    use_lockfile = true
  }
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "site" {
  bucket = "mounikola-devops-site-2026-1117"
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadWebsiteFiles"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.site.arn}/*"
    }]
  })
}

import {
  to = aws_s3_bucket.site
  id = "mounikola-devops-site-2026-1117"
}

import {
  to = aws_s3_bucket_website_configuration.site
  id = "mounikola-devops-site-2026-1117"
}

import {
  to = aws_s3_bucket_public_access_block.site
  id = "mounikola-devops-site-2026-1117"
}

import {
  to = aws_s3_bucket_policy.site
  id = "mounikola-devops-site-2026-1117"
}
