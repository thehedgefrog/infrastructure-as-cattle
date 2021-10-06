# Infrastructure as Cattle

  - [Why?](#why)
  - [How to use](#how-to-use)
    - [Prerequisites](#prerequisites)
    - [Creating a template](#creating-a-template)
    - [Deploying infrastructure](#deploying-infrastructure)
  - [Defaults](#defaults)

This is my implementation of the 'infrastructure as cattle' concept.  While this is working for me right now, I will try to keep it up to date with my best practices.

### Why?
Homelabbers have a tendency to treat infrastructure as pets.  This is something I used to do.  That means updating VMs manually, making tons of manual changes and - crucially - being devastated when something happens to your VM, because all that work is lost.

By treating it as cattle, you can build and destroy infrastructure in a few commands, and it will always get created how you want it and fully updated.  When you want a cluster, spin it up - when you're done with it, destroy it and don't worry about it.

## How to use
### Prerequisites
- A local machine with Ansible, Packer and Terraform installed
- VMware vSphere 7 (this setup does not work on free ESXi)
- A good text editor (optional, but highly recommended)
- Smallstep SSH (optional, free, makes SSH to your machines a breeze)

### Creating a template
Your template is your base to customize and work on.  Clone this repo on your machine, and go through and customize files.

Validate your config - `$~ cd packer` then run
- `packer init .`
- `packer validate .`
- `packer build .`

In 15-20 minutes, you will have a fully installed, fully updated, customized template of Ubuntu.  This only needs to be updated when you need to make a change to the template itself, or to upgrade the OS version.  The Terraform process is independant of this, so you can apply and destroy Terraform resources without touching the template or Packer itself.

### Deploying infrastructure
This is where you customize your VMs, decide how many you spin up, and choose what you create.

`$~ cd terraform`, then
- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply`

When you want to get rid of your VMs, run `terraform destroy`.

## Defaults
| SSH username | SSH password |
| --- | --- |
| packer | packer |
|

### That's it!