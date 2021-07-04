## Terrafrom state remote storage
- All scenarios we tested till now we assumed that someone would be storing the terraform state locally, while this works fine for a single dev on a small project<br>
But when it comes to a team working on the same project, you will require a solution where you can store the latest state of your infrastructure somewhere remotely probably on cloud / remote storage
- Advantages of storing the Terraform state remotely are many, to list a few:
    1. Allows easy collaboration as the team working on a time can pull the latest state of the infrastructure
    2. Some cloud providers provide remote state locking, hence solving the issue of simultaneous changes to the state, the list of these providers is elaborate, e.g Amazon S3, Google Cloud storage etc support remote state locking
    3. On Terraform Cloud by Hashicorp, it provides mechanism to apply stronger locking concept, and detection on any new plan before the last plan is approved

#

- In this exercise we will use Amazon S3 to store our Terraform state remotely:

    1. We will pull a Nginx image from Docker and will create a Docker container locally and use Amazon S3 as backend to store our state file<br>


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
    2. 