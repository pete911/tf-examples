# Terraform remote plan

## run a remote plan locally

Global settings:
- login to terraform cloud
- generate token `user -> user settings -> tokens`
- add token to `~/.terraformrc` file:
```terraform
credentials "app.terraform.io" {
 token = "<token>"
}
```

Project settings:
- go inside tf project `cd <tf-project>`
- remove configuration file `rm -rf .terraform`
- crate `state.tf` file:
```terraform
terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "<organization>"
        workspaces {
            name = "<workspace>"
        }
    }
}
```

Now you can use remote state from terraform cloud locally:
- `terraform init`
- `terraform plan`
