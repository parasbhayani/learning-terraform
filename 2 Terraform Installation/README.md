## Installing Terraform on Linux / Windows*

- Download binary package of terraform using the wget command (curl can also used):

> wget -c https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip

- Unzip the downloaded file:

> unzip terraform_0.13.4_linux_amd64.zip

- Place the Terraform binary in the PATH of the VM operating system so the binary is accessible system-wide to all users:<br>

> echo $PATH

- Move the output to any of the above System PATHs

> sudo mv terraform /usr/sbin/<br>

(Running above as Sudo, if prompted please enter credentials)

Check the Terraform version information (to verify installation status):

> terraform -version

Since the Terraform version is returned, you have validated that the Terraform binary is installed and working properly.