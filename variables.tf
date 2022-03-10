variable "region" {
  default = "ap-southeast-2"
}

variable "application" {
  type        = string
  description = "Application Name"
  default     = "YOUR_APP"
}

variable "environment" {
  type        = string
  description = "Application Environment"
  default     = "YOUR_STAGE"
}

# INSERT A NUMBER 0-9 FOR THE CIDR BLOCK
variable "quad" {
  default = ""
}
