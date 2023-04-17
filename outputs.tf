output "id" {
  description = "The ID of the AppConfig application"
  value       = aws_appconfig_application.this.id
}

output "arn" {
  description = "The ARN of the AppConfig application"
  value       = aws_appconfig_application.this.arn
}

output "environment_ids" {
  description = "A map of all environment IDs"
  value       = {
    for k, v in aws_appconfig_environment.this :
    k => v.environment_id
  }
}

output "configuration_profile_ids" {
  description = "A list of all configuration profile IDs"
  value       = {
    for k, v in aws_appconfig_configuration_profile.this :
    k => v.configuration_profile_id
  }
}
