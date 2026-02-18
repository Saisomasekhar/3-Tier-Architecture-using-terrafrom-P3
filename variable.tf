# variable "aws" {
#     profile = "default"
#     region = "us-east-1"
  
# }

variable "aws_profile" {
  description = "AWS Profile to be used"
  type        = string
  default     = "default"
}
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}