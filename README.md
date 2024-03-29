# Terraform Beginner Bootcamp 2023

A preparation week

## AWS Credentials

```
gp env AWS_ACCESS_KEY_ID=whatever
gp env AWS_SECRET_ACCESS_KEY=whatever
gp env AWS_DEFAULT_REGION=eu-central-1
```

for this env vars to be recognized in Terraform peocessing, it is good to also add them  with "TF_VAR_" prefix:

```
gp env TF_VAR_AWS_ACCESS_KEY_ID=whatever
gp env TF_VAR_AWS_SECRET_ACCESS_KEY=whatever
gp env TF_VAR_AWS_DEFAULT_REGION=eu-central-1
```

After next time Gitpod will start the env, this Gitpod vars will be also available as normal env vars.

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

Instruction how to migrate this infra to cloud: 
https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate

To connect to Terraform Cloud, we need to place token into
`open /home/gitpod/.terraform.d/credentials.tfrc.json`

and then 
`terraform login`

Variables for Terraform cloud should be set in the Workspace:
https://app.terraform.io/app/qbeckmansion/workspaces/terra-house-1/variables

And the deployed resources can be seen here:
https://app.terraform.io/app/qbeckmansion/workspaces/terra-house-1

Terraform has variables. Can be declared in variables.tf. Can be ovverriten by 
`terraform -var name="value"`

For modules, if there is new output that module should return, it shhould be defined
- first in module outputs.tf
- second, in root module outputs.tf

### Terraform AWS provider features

There can be 
* [data sources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)
* [S3 website conf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)
* [S3 object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)

### Changing the Lifecycle of Resources

[Meta Arguments Lifcycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)


### Terraform Data

Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

https://developer.hashicorp.com/terraform/language/resources/terraform-data

### Terraform Cloud

In [Terraform Cloud](https://app.terraform.io/) we can have local or remote project run (plan or apply)
For local, it means the entire run will happen localy on own machine (eg on Gitpod env, or in docker, or on own computer. For remote, it means thing will happen on TCloud. Then all env variables must be set in the TCoud as well.
Separately we can connect TCloud to our repo, and given branch, and trigger TCloud run, when new code is pushed to branch. In this case, project should be in "remote" Execution Mode. 

## Moving html file into S3 bucket by CLI

`aws s3 cp public/index.html s3://bartosz-tfc-bootcamp/index.html`


## Provisioners

Provisioners allow you to execute commands on compute instances eg. a AWS CLI command.

They are not recommended for use by Hashicorp because Configuration Management tools such as Ansible are a better fit, but the functionality exists.

[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

### Local-exec

This will execute command on the machine running the terraform commands eg. plan apply

```tf
resource "aws_instance" "web" {
  # ...
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
```

https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec

### Remote-exec

This will execute commands on a machine which you target. You will need to provide credentials such as ssh to get into the machine.

```tf
resource "aws_instance" "web" {
  # ...
  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}
```
https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec

### using Terraform console

And the command to list files
```
terraform console
> fileset( "${path.root}/public/assets", "*")
```

## For Each Expressions

For each allows us to enumerate over complex data types

```sh
[for s in var.list : upper(s)]
```

This is mostly useful when you are creating multiples of a cloud resource and you want to reduce the amount of repetitive terraform code.

[For Each Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)

## Terraform custom provider

You can create custom provider to turn off all by writing a go application that will provide a set of CRUD operations. A good starting point is to use [scaffolding project](https://github.com/hashicorp/terraform-provider-scaffolding-framework) and/or goign through [this doc](https://www.hashicorp.com/blog/writing-custom-terraform-providers).
The way it work, is that in TF we can create new *resource*, and when executing `terraform apply`, the provider will use Create Go-lang function, from the CRUD set. If we do a change in the *resource*, and then `terraform apply`, the Update opration will be executed.
This CRUD operations can do anything. Eg call external RestAPI endpoint from our custom service.

## Resources

- [Gitpod tasks](https://www.gitpod.io/docs/configure/workspaces/tasks)
- [Terraform cloud dash](https://app.terraform.io/app/getting-started)
- [Terraform CLI instalation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Terraform modules ](https://registry.terraform.io/browse/modules)
- [Terraform providers ](https://registry.terraform.io/browse/providers)
- [Terraform Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- [Teraform Modules](https://developer.hashicorp.com/terraform/language/modules/sources)
- [S3 website conf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)
- [S3 object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)
- [Terraform Data sources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)