## Terraform state remote storage
- All scenarios we tested till now we assumed that someone would be storing the terraform state locally, while this works fine for a single dev on a small project<br>
But when it comes to a team working on the same project, you will require a solution where you can store the latest state of your infrastructure somewhere remotely probably on cloud / remote storage
- Advantages of storing the Terraform state remotely are many, to list a few:
    1. Allows easy collaboration as the team working on a time can pull the latest state of the infrastructure
    2. Some cloud providers provide remote state locking, hence solving the issue of simultaneous changes to the state, the list of these providers is elaborate, e.g Amazon S3, Google Cloud storage etc support remote state locking
    3. On Terraform Cloud by Hashicorp, it provides mechanism to apply stronger locking concept, and detection on any new plan before the last plan is approved

#

- In this exercise we will use Amazon S3 to store our Terraform state remotely:

    1. We will pull a Nginx image from Docker and will create a Docker container locally and use Amazon S3 as backend to store our state file<br>
    This has been incorporated in the main.tf file

    2. To set the remote backend for storing Terraform state, we would be using keyword *backend* and mentioned in below snippet, and passing params like AWS profile, region, key(name of remote file object) and the S3 bucket where-in it will store the remote state<br>
    This is to included in file backend.tf
    P.S: These functionalities are available in Terraform version 0.13 & above hence we set the required version to be above that<br>

        In-case your terraform installation version is below this, consider [upgrading it to run this exercise](https://www.terraform.io/upgrade-guides/0-13.html)


        ```
        terraform {
        backend "s3" {
            profile = "demo"
            region  = "us-east-1"
            key     = "terraform.tfstate"
            bucket  = "<AWS-S3-BUCKET-NAME-GOES-HERE>"
            }      
        }
        ```
    3. The variables.tf file defines the external port variable used in the main file, here a *validation is applied* in order it to only be 8080 or 80, and no other variable values would be accepted

    4. After running terraform init, plan & apply you will see that the output URL would be something like these, open the same in browser to verify it is running nginx web server as expected

        > http://localhost:8080/

    5. You may delete the setup by running

        > terraform destroy --auto-approve
