resource "aws_appconfig_application" "this" {
  name        = var.name
  description = var.description

  tags = var.tags
}

resource "aws_appconfig_environment" "this" {
  for_each = var.environments

  name        = coalesce(try(each.value.name, null), each.key)
  description = try(each.value.description, null)

  application_id = aws_appconfig_application.this.id

  tags = try(each.value.tags, {})
}

resource "aws_appconfig_configuration_profile" "this" {
  for_each = var.configuration_profiles

  name        = coalesce(try(each.value.name, null), each.key)
  description = try(each.value.description, null)
  type        = try(each.value.type, "AWS.Freeform")

  application_id = aws_appconfig_application.this.id
  location_uri   = coalesce(try(each.value.location_uri, null), "hosted")

  dynamic "validator" {
    for_each = lookup(each.value, "validators", null) != null ? each.value.validators : [
      # default json validator
      {
        content = jsonencode({
          "$schema"              = "http://json-schema.org/draft-04/schema#"
          "description"          = "Ensure the configuration is in valid JSON format and allowing any properties in the JSON object"
          "type"                 = "object"
          "additionalProperties" = true
        })
        type = "JSON_SCHEMA"
      }
    ]
    content {
      content = validator.value.content
      type    = validator.value.type
    }
  }

  tags = try(each.value.tags, {})
}
