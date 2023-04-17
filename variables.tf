variable "name" {
  description = "(Required) The name of the AppConfig application"
  type        = string
  nullable    = false
}

variable "description" {
  description = "(Optional) A description for the AppConfig application"
  type        = string
  nullable    = true
}

variable "environments" {
  description = "(Optional) A list of environments to create"
  type        = map(object({
    name        = optional(string)
    description = optional(string)
    tags        = optional(map(string))
  }))
  nullable = false
}

variable "configuration_profiles" {
  description = "(Optional) A list of configuration profiles to create. Defaults to freeform hosted configuration"
  type        = map(object({
    name         = optional(string)
    description  = optional(string)
    type         = optional(string)
    location_uri = optional(string)
    tags         = optional(map(string))
  }))
  nullable = false
}

variable "tags" {
  description = "(Optional) Tags for the AppConfig application"
  type        = map(string)
  default     = {}
}
