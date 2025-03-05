# s3 variables
variable "project_name" {}
variable "env_file_bucket_name" {}
variable "env_file_name" {
    description = "The name of the environment file to upload"
    type = string
    default = "env_file.env"
}