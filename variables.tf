# root variables.tf

variable "client" {
  description = "Client name for resource naming."
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



variable "suffix" {
  description = "Numerical identifier for resources"
  type        = string
}

variable "owner" {
  description = "Person responsible for the resource"
  type        = string
}

variable "project" {
  description = "Main project associated with this deployment"
  type        = string
}

variable "created_by" {
  description = "Tag showing Terraform created this resource"
  type        = string
}

variable "subscription_id" {
  description = "Subscription_ID to deploy resources to"
  type        = string
}

