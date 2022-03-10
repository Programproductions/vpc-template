variable "region" {
  default = "ap-southeast-2"
}

variable "application" {
  type        = string
  description = "Application Name"
  default     = "test"
}

variable "environment" {
  type        = string
  description = "Application Environment"
  default     = "dev"
}


variable "quad" {
  default = "2"
}
