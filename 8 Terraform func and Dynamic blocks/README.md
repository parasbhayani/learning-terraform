## Terraform built-in functions

- Terraform provides a wide-range of built functions which we have used before (*join func* in 6 Terraform state remote storage)
- There are no user defined functions, but the list of built in functions is quite extensive and is growing

- You may reference all [built-in function here](https://www.terraform.io/docs/language/functions/index.html)

- To test the functions out you can use below command, which opens up a console, where you can test the built in functions

    ```
    terraform console
    ```

#

## Variables in Terraform

- Variable types in terraform are two types:
    1. Primitive (number, string, bool)
    2. Complex (list, tuple, map, object)<br>
        2.1 Collection type<br>
        2.2 Structural type<br>

- *'any'* is primitive type placeholder, where-in the type is not defined and terraform makes best effort to identify its type at runtime

    ```
    variable "mylist" {
        type = list(any)
        default = ["AMI", "CIDR", "REGION"]
    }
    ```

#

## Dynamic Blocks in Terraform

- Dynamic blocks help construct repeatable nested configuration in your terraform code
- They can be used for resources
    1. Resource
    2. Providers
    3. Data
    4. Provisioners

- The purpose of using of Dynamic blocks is to make code maintainable and cleaner

- *dynamic* keyword is used to create a Dynamic block

- We will using [locals](https://www.terraform.io/docs/language/values/locals.html) to declare the value in form of two values to a complex variable (which will be used locally by terraform code)


