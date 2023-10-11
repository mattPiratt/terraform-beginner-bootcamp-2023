variable "AWS_DEFAULT_REGION" {
}
variable "AWS_SECRET_ACCESS_KEY" {
}
variable "AWS_ACCESS_KEY_ID" {
}
variable "USER_UUID" {
    description = "ExamPro user id"
    type = string
}
variable "BUCKET_NAME" {
    description = "ExamPro Bootcamp Website Bucket Created By Terraform"
    type = string

}

variable "public_path" {
  description = "The file path for the public directory"
  type        = string
}
variable "content_version" {
  description = "The content version. Should be a positive integer starting at 1."
  type        = number

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1."
  }
}
