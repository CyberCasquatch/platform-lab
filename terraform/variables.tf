variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for tagging"
  type        = string
  default     = "platform-lab"
}