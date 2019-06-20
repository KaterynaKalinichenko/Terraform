# Terraform 
### We need to deploy VPC and 3 subnets.
#### Services_subnet will be accessible only from Backend_subnet and might be without opportunity accessing internet. Backend_subnet will have the separate configuration but with ability to work with internet in one way (NAT model). Frontend subnet instance might be accessible from external hosts with 443 port. (22, 80, 3389 – restricted).
#### Deploy  3 ( > if possible )  AWS instances [Linux] in different subnets. Install apache on Frontend_subnet based one using “user data”.

### First we need Deploy VPC 
##### We can refer to the Terraform documentation, which is one of the best. 
##### We need to go to the site https://www.terraform.io/docs/providers/aws/r/vpc.html and find how to create VPS for AWS. 
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/site.PNG) 
##### Write the VPC creation code to the file main.tf, which you can change or add additional attributes to create a more sophisticated network. 
##### Open your console and and execute this command.
```terraform plan ```
##### Terraform will check the changes and point out any shortcomings or errors you made in the code. 
##### If all is well, it will show you a list of changes. 
###### (This command is used in particular by beginners in order not to harm the environment and double-check the correctness of the code.)
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/vpc%20plan%20.PNG)
##### We make our changes, which will be uploaded to the AWS.
```terraform apply ```   

![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/vpc%20apply.PNG)
##### As we can see, everything went well.
##### Now let's check out VPCs.
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/vpc.PNG)
#### Here it is! We just created a VPC using Infrastructure As a Code!

### Now add 3 subnets (back/front/services)  
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/add%20subgr.PNG)
#### It's our subnets for VPC. We can make it for each vm.

### Create security group  for  open ports 443 and close ports 80,22,3389 on our Frontend machine. 
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/security%20gro.PNG)
#### And check it on AWS.
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/subgr%20list.PNG)
#### Let's check it, can we connect to machine or not.
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/security%20port%2022.PNG)
#### We made sure that its imposible to connect on machine.

#### We got such beauty!
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/vpc%20%2B%20sub.PNG)

### And now we need to create our VMs.
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/creating%20intacce.PNG)
#### And check it on AWS.
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/our%20instance.PNG)
#### Using instance Frontend as an example, let's check if all settings have been applied.
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/settings%20for%20instance.PNG)
