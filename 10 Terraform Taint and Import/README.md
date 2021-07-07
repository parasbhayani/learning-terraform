## Terraform taint

- *This command is deprecated from v0.15.2 and above better functionality would be to use,*
    ```
    terraform apply -replace="aws_instance.example[0]"
    ```

- The taint command can be used to replace the current resource with the new one<br>
    The dependent resources on the same would also have an impact
    for e.g You can use the example in [exercise 4](https://github.com/parasbhayani/learning-terraform/tree/master/4%20Apache%20web%20server%20using%20provisioners) in this repo to replicate this

- You may create Apache web server from above server, and lets say if want to recreate this web server, the output IP address would change

- You can mark this resource tainted using,

    ```
    $ terraform taint aws_instance.webserver
    Resource instance aws_instance.webserver has been marked as tainted.
    ```
- After *terraform apply* the command, you will able to see the web server getting re-created with output giving new IP and the older web server is removed (destroyed)

#

## Terraform import

- [Import functionality](https://www.terraform.io/docs/cli/import/index.html) is useful in bringing resources created by other means under Terraform management

- *If you import the same object multiple times, Terraform may exhibit unwanted behavior*

- Prior to running terraform import it is necessary to write manually a resource configuration block for the resource, to which the imported object will be mapped.


