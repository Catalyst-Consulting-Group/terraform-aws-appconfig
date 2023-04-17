# AWS AppConfig Terraform Module

A Terraform module that creates an AWS AppConfig Application with many Environments and Configuration Profiles.

Also includes a submodule used for creating an IAM policy for use with applications.

## Usage

```terraform
module "foobar_appconfig" {
  source  = "Catalyst-Consulting-Group/appconfig/aws"
  version = "1.0.0"

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

## Authors

This module is maintained by [Catalyst Consulting Group, Inc](https://github.com/Catalyst-Consulting-Group).

## License

MIT License. See [LICENSE](./LICENSE) for full details.
