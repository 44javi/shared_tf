variable "project" {
  description = "Main project associated with this deployment"
  type        = string
}

variable "environment" {
  description = "Environment for the resources (e.g., dev, prod)."
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
}

variable "owner" {
  description = "Person responsible for the resource"
  type        = string
}

variable "createdBy" {
  description = "Tag showing Terraform created this resource"
  type        = string
}

variable "email" {
  description = "central email for alerts and notifications"
  type        = string
}
