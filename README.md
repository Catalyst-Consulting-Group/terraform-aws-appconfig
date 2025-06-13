# AWS AppConfig Terraform Module

A Terraform module that creates an AWS AppConfig Application with many Environments and Configuration Profiles.

Also includes a [submodule](./modules/session-policy/README.md) used for creating an IAM policy for use with applications.

## Usage

```terraform
module "foobar_appconfig" {
  source  = "Catalyst-Consulting-Group/appconfig/aws"
  version = "~> 1.0"

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

To create a validator, use the `validators` variable

```terraform
module "foobar_appconfig" {
  source  = "Catalyst-Consulting-Group/appconfig/aws"
  version = "~> 1.0"

  name        = "foobar"
  description = "Foobar Configuration"

  environments = {
    main = {}
  }

  configuration_profiles = {
    main = {
      validators = [
        {
          content = jsonencode({
            "$schema"              = "http://json-schema.org/draft-04/schema#"
            "description"          = "Ensure the configuration is in valid JSON format and allowing any properties in the JSON object"
            "type"                 = "object"
            "additionalProperties" = true
          })
          type = "JSON_SCHEMA"
        }
        # ...
      ]
    }
  }
}
```

## Authors

This module is maintained by [Catalyst Consulting Group, Inc](https://github.com/Catalyst-Consulting-Group).

## License

MIT License. See [LICENSE](./LICENSE) for full details.
