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
  description = "(Optional) A map of environments to create"
  type = map(object({
    name        = optional(string)
    description = optional(string)
    tags        = optional(map(string))
  }))
  nullable = false
  default  = {}
}

variable "configuration_profiles" {
  description = "(Optional) A map of configuration profiles to create. Each profile defaults to 'AWS.Freeform' `type` and 'hosted' `location_uri`"
  type = map(object({
    name         = optional(string)
    description  = optional(string)
    type         = optional(string)
    location_uri = optional(string)
    tags         = optional(map(string))
    validators = optional(list(object({
      content = string
      type    = string
    })))
  }))
  nullable = false
  default  = {}
}

variable "tags" {
  description = "(Optional) A map of tags for the AppConfig application"
  type        = map(string)
  default     = {}
}
