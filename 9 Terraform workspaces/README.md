## Terraform workspaces

- Terraform workspaces allow the user to create seperate workspaces in the same working directory
- The state files are seperately managed by Terraform for each of the workspaces

- By default, there is a *default* workspace that is created

- default workspace files are stored ***terraform.tfstate*** folder while the workspace files for all other workspaces are stored under ***terraform.tfstate.d***

- For creating new workspace you may run below command,

    ```
    $ terraform workspace new UAT
    Created and switched to workspace "UAT"!

    You're now on a new, empty workspace. Workspaces isolate their state,
    so if you run "terraform plan" Terraform will not see any existing state
    for this configuration.
    ```
- To list out the workspace in the environment you may run below command,

    ```
    $ terraform workspace list
    * default
    UAT
    ```
- To switch between the workspace you may use below command,

    ```
    $ terraform workspace select default
    Switched to workspace "default".
    ```
- In our example provider definition we setting a condition to choose the region of AWS based on the selected workspace,

    If you observe,

    ```
    provider "aws" {
    region = terraform.workspace == "default" ? "us-east-1" : "us-west-2"
    }
    ```
    The condition is the **default** workspace is currently selected then region for deploying resources will be *us-east-1* else for all other workspaces the region of deployment will *us-west-2*

- This way it creates seperate VPCs, Subnets, security groups, EC2 instances,get AMI ID based on region of deployment **based on workspace**

- You can create first *terraform apply* in first workspace and then in second to verify both of them are getting created separately

- You may delete a workspace using the below command,

    ```
    $ terraform workspace delete UAT
    Deleted workspace "UAT"!
    ```