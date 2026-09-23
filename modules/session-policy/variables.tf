variable "name" {
  description = "The name of the policy"
  type        = string
}

variable "description" {
  description = "A description for the policy"
  type        = string
  default     = null
}

variable "configurations" {
  description = "A list of application, environment, and configuration profile mappings"
  type        = list(object({
    application_id           = string
    environment_id           = string
    configuration_profile_id = string
  }))
}

variable "tags" {
  description = "Tags for the policy"
  type        = map(string)
  default     = {}
}
