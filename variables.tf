variable "AWS_DEFAULT_REGION" {
}
variable "AWS_SECRET_ACCESS_KEY" {
}
variable "AWS_ACCESS_KEY_ID" {
}
variable "USER_UUID" {
}
variable "terratowns_endpoint" {
}
variable "TERRATOWNS_ACCESS_TOKEN" {
}

variable "arcanum" {
  type = object({
    public_path = string
    content_version = number
  })
}
variable "darkknight" {
  type = object({
    public_path = string
    content_version = number
  })
}