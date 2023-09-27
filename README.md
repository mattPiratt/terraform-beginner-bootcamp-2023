# Terraform Beginner Bootcamp 2023

A preparation week

## AWS Credentials

```
gp env AWS_ACCESS_KEY_ID=whatever
gp env AWS_SECRET_ACCESS_KEY=whatever
gp env AWS_DEFAULT_REGION=eu-central-1
```

And testing command is `aws sts get-caller-identity`

## Terraform basics

I am using [random provider](https://registry.terraform.io/providers/hashicorp/random/latest)
```
terraform init
terraform plan
terraform apply
```

There are also [terraform modules ](https://registry.terraform.io/browse/modules)

After adding additional provider, we need to run 
`terraform init -upgrade`

We can destroy/delete whatever was previously created by
`terraform destroy`


## Resources

- [Gitpod tasks](https://www.gitpod.io/docs/configure/workspaces/tasks)
- [Terraform cloud dash](https://app.terraform.io/app/getting-started)
- [Terraform CLI instalation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Terraform modules ](https://registry.terraform.io/browse/modules)
- [Terraform providers ](https://registry.terraform.io/browse/providers)