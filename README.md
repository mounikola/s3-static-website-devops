# Static Website on Amazon S3

A beginner DevOps project hosting a static website on Amazon S3.

## Live website

[Open the website](http://mounikola-devops-site-2026-1117.s3-website-ap-southeast-2.amazonaws.com)

## Project setup

- **Amazon S3:** hosts the public `index.html` page.
- **Terraform:** describes the website bucket, website settings, and read-only public access policy.
- **Terraform remote state:** stored in a separate private S3 bucket with versioning enabled.
- **GitHub Actions:** checks that the homepage exists, checks for a page title, and validates Terraform formatting and configuration.

## Update the website

Upload the updated `index.html` to the website bucket in the S3 console. GitHub Actions checks the repository files when changes are pushed, but it does not deploy them to S3.

## Region

Asia Pacific (Sydney) (`ap-southeast-2`)
