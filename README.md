### Hello UXPin!

I am happy to introduce Adele v.2.  
It is available under the URL:
http://www.uxpin.fun/

Codebase presented in the repo allows to build a docker image ([same as this docker image](https://hub.docker.com/r/agnieszkatatara/adele/)) and deploy an ec2 with dockerized app in newly created VPC. 

In order to test terraform code, it is required to pass credentials file location in **terraform/main.tf**.

I added terraform binary to ease the pain of testing. It is only required to use regular `./terraform plan` and `./terraform apply` commands.

#### Cheers
