# `session-policy`

An IAM policy that enables fetching the latest configuration and establishing a session with AWS AppConfig for multiple applications, environments, and configuration profiles.

## Usage

```terraform
module "foobar_appconfig_policy" {
  source  = "Catalyst-Consulting-Group/appconfig/aws//modules/session-policy"
  version = "~> 1.0"

  name = "foobar-appconfig-policy"

  configurations = [
    {
      application_id           = module.foobar_appconfig.id
      environment_id           = module.foobar_appconfig.environment_ids["main"]
      configuration_profile_id = module.foobar_appconfig.configuration_profile_ids["main"]
    }
  ]
}
```

You can then attach this policy to any principal that requires it.
