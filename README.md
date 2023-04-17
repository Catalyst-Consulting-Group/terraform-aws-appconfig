# Terraform Module

## Features

1. **AppConfig Application, Environments, and Configuration Profiles**
2. **IAM Session Policy**. Creates a policy that allows fetching the latest configuration and establishing a session with AWS AppConfig for multiple applications, environments, and configuration profiles.

## Usage

```terraform
module "foobar_appconfig" {
  source  = "TODO"
  version = "X.X.X"

  name        = "foobar"
  description = "Foobar Configuration"

  environments = {
    main = {}
  }

  configuration_profiles = {
    main = {}
  }
}
```

This will create an AppConfig application named `foobar`, with 1 environment named `main` and 1 profile named `main`.

By default, profiles will be created as `hosted` `AWS.Freeform`, however this can be overridden.
Please refer to `variables.tf` for more information.

`session-policy`:

```terraform
module "foobar_appconfig_policy" {
  source  = "TODO"
  version = "X.X.X"

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

## Authors

This module is maintained by [Catalyst Consulting Group, Inc](https://github.com/Catalyst-Consulting-Group).

## License

MIT License. See [LICENSE](./LICENSE) for full details.
