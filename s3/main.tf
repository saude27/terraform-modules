# create an s3 bucket 
resource "aws_s3_bucket" "env_file_bucket" {
  bucket = "${var.project_name}-${var.env_file_bucket_name}"

  lifecycle {
    create_before_destroy = false
  }
}

# upload the environment file from local computer into the s3 bucket
resource "aws_s3_object" "upload_env_file" {
  bucket = aws_s3_bucket.env_file_bucket.id
  key    = var.env_file_name
  source = "${path.module}/${var.env_file_name}" 
  etag   = filemd5("${path.module}/${var.env_file_name}")
}