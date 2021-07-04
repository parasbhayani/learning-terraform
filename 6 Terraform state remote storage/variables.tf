variable "external_port" {
  type    = number
  default = 8080
  validation {
    condition     = can(regex("([8-8][0-0][8-8][0-0])$|([8-8][0-0])$", var.external_port))
    error_message = "Port values can only be 8080 or 80."
  }
}