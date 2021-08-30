## Description
Use private module published in TFC

## Pre-requirements

* [Terraform cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)


## How to use this repo

- Clone
- Run
- Cleanup

---

### Clone the repo

```
git clone https://github.com/viv-garot/terraform-hashicorp-private-null
```

### Change directory

```
cd terraform-hashicorp-private-null/run/
```

### Run

* Run terraform init to download the private modules:

```
terraform init
```

_sample_:

```
terraform init
Initializing modules...
Downloading app.terraform.io/vivien-paid-org/private-null/hashicorp 1.0.0 for private-null...
- private-null in .terraform/modules/private-null
Downloading app.terraform.io/vivien-paid-org/private-null2/hashicorp 1.0.0 for private-null2...
- private-null2 in .terraform/modules/private-null2

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.1.0...
- Installed hashicorp/null v3.1.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

* Run terraform apply to create the null resources:

```
terraform apply
```

_sample_:

```
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.private-null.null_resource.helloWorld will be created
  + resource "null_resource" "helloWorld" {
      + id = (known after apply)
    }

  # module.private-null2.null_resource.byeWorld will be created
  + resource "null_resource" "byeWorld" {
      + id = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.private-null2.null_resource.byeWorld: Creating...
module.private-null.null_resource.helloWorld: Creating...
module.private-null.null_resource.helloWorld: Provisioning with 'local-exec'...
module.private-null2.null_resource.byeWorld: Provisioning with 'local-exec'...
module.private-null.null_resource.helloWorld (local-exec): Executing: ["/bin/sh" "-c" "echo hello world"]
module.private-null2.null_resource.byeWorld (local-exec): Executing: ["/bin/sh" "-c" "echo bye world"]
module.private-null.null_resource.helloWorld (local-exec): hello world
module.private-null2.null_resource.byeWorld (local-exec): bye world
module.private-null.null_resource.helloWorld: Creation complete after 0s [id=7191196086801482827]
module.private-null2.null_resource.byeWorld: Creation complete after 0s [id=4671152892263540064]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

### Cleanup

```
terraform destroy
```

_sample_:

```
terraform destroy
module.private-null.null_resource.helloWorld: Refreshing state... [id=7191196086801482827]
module.private-null2.null_resource.byeWorld: Refreshing state... [id=4671152892263540064]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.private-null.null_resource.helloWorld will be destroyed
  - resource "null_resource" "helloWorld" {
      - id = "7191196086801482827" -> null
    }

  # module.private-null2.null_resource.byeWorld will be destroyed
  - resource "null_resource" "byeWorld" {
      - id = "4671152892263540064" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.private-null2.null_resource.byeWorld: Destroying... [id=4671152892263540064]
module.private-null.null_resource.helloWorld: Destroying... [id=7191196086801482827]
module.private-null2.null_resource.byeWorld: Destruction complete after 0s
module.private-null.null_resource.helloWorld: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
```
