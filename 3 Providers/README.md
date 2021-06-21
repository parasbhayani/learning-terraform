## Using Providers in Terraform

- Here we are going to use AWS providers to provision resource to AWS<br>
Two resources for illustration; **SNS** would be deployed into two AWS regions

- Copy the code in main.tf file which deploys SNS resources in us-east-1 and us-west-2

- For seeing verbose logs in terraform we have an [environmental variable](https://www.terraform.io/docs/cli/config/environment-variables.html) called *TF_LOG*

- You can set *TF_LOG* to one of the log levels TRACE, DEBUG, INFO, WARN or ERROR to change the [verbosity](https://www.terraform.io/docs/internals/debugging.html) of the logs.

> export TF_LOG=TRACE

- Set the *TF_LOG* to Trace to set the actions that Terraform performs in backend, while executing any of terraform statements such as init, plan, validate, apply etc.

> terraform init

- *init* is first statement to download the dependency provider packages under .terraform directory under working directory

> terraform validate

- This is to *validate* the .tf templates in the working directory to check for any mistakes in the template, if there are none, then SUCCESS is returned from it

> terraform plan

- *plan* shows the impact of the terraform statement, and indicates what resources will be created or destroyed after the terraform template will be applied

> terraform apply

- *apply* the changes into terraform, you will see the resource stack created from it<br>
It will ask for a prompt asking if you really want changes to be applied, type in 'yes' therein

> terraform destroy --auto-approve

- *destroy* it destroy the resources tracked by the .tf templates, *--auto-approve* switch indicates that no prompt should be displayed to user for confirmation of creation / deletion of resources
