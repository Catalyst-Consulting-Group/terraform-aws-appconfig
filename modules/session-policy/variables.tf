variable "name" {
  description = "(Required) The name of the policy"
  type        = string
}

variable "description" {
  description = "(Optional) A description for the policy"
  type        = string
  default     = null
}

variable "configurations" {
  description = "(Required) A list of application, environment, and configuration profile mappings"
  type        = list(object({
    application_id           = string
    environment_id           = string
    configuration_profile_id = string
  }))
}

variable "tags" {
  description = "(Optional) Tags for the policy"
  type        = map(string)
  default     = {}
}
