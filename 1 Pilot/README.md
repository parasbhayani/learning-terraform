## First Terraform deployment (Pilot)

- The aim of this configuration is to understand the basic working with the providers in Terraform, wherein
we used the alias for the region in AWS

- For testing this configuration out you will need an AWS account (Access ID and Secret Access Key), AWS CLI installed to configure it in your IDE

You can run 

>**aws configure**<br>

- First we run **terraform init** which initiates the directory to be used by terraform so that it searches for the all .tf and intelligently combines them and search for all providers in it<br>
It will download the provider dependency files as required

- Providers can be AWS, Azure, GCP, Docker, K8s, VMware etc. the list is quite elaborative

- After running init, we will validate our .tf file for any configuration issue or typos with **terraform validate**, if all is good it will return SUCCESS result
This helps in identifying any issue with configuration before try to apply our changes

- Post this we run **terraform plan** to check a dry-run sort of output, where terraform indicates what will be the impact of the new deployment to the existing infrastructure
- It will show the resource that will be created (green) and resource (red) that will be removed post applying the configuration

- At last we use **terraform apply** to apply the change deploy the changes to our cloud or selected target platform
