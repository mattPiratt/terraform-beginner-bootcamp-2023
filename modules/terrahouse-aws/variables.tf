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

variable "FILE_index_html" {
  type = string

  validation {
    condition = fileexists(var.FILE_index_html)
    error_message = "index.html file does not exist"
  }
}
variable "FILE_error_html" {
  type = string

  validation {
    condition = fileexists(var.FILE_error_html)
    error_message = "error.html file does not exist"
  }
}
