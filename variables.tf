variable "repo_full_name" {
  type        = string
  description = "Repo name"
  default     = "stackcouture/s3-website-oidc-terraform"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket"
  default     = "s3-website-oidc-terraform"
}