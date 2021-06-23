## Terraform provisioners - Creating an Apache Web server

- *Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.*

- To be used as a **last resort** because, there will always be certain behaviors that can't be directly represented in Terraform's declarative model.

- Terraform **cannot model the actions of provisioners** as part of a plan because they can in principle take any action.

- Most cloud platform provide mechanism to provide user data, and such data is immediately passed to it at time of the boot.

> e.g Amazon EC2: **user_data** or **user_data_base64** on aws_instance, aws_launch_template, and aws_launch_configuration

> Microsoft Azure: **custom_data** on azurerm_virtual_machine or azurerm_virtual_machine_scale_set

- Many official Linux distribution disk images include software called [cloud-init](https://cloudinit.readthedocs.io/en/latest/) allowing you to run arbitrary scripts or do basic system configuration without accessing machine over SSH

- *local-exec* provisioning method does not require any other setup, but *other provisioners (file / remote-exec)* must mention a **connection** block directing terraform on how to connect to the server

- Provisioner refer to the parent resource by **self** for e.g *self.public_ip* or *self.ami* for an AWS EC2 instance

- There are two types of provisioners:<br>
1. Creation time
2. Destroy time<br>

    **when = destroy** is mentioned in the provisioner condition it will run as a *Destroy time*

- The **on_failure** setting can be used to change this. The allowed values are:

1. *continue* - Ignore the error and continue with creation or destruction.

2. *fail* - Raise an error and stop applying (the default behavior). If this is a creation provisioner, taint the resource.