# Terraform 
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
##### Now let's check out VPCs
![alt-текст](https://github.com/KaterynaKalinichenko/Terraform/blob/master/images/vpc.PNG)
##### Here it is! We just created a VPC using Infrastructure As a Code!



