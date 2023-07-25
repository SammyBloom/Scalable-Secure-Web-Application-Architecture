# Scalable-Secure-Web-Application-Architecture



<p align="center">
  <h3 align="center">Scalable-Secure-Web-Application-Architecture</h3>
  
  <p align="center">
    A 3-tier web application solution that is scalable and secure using AWS and Terraform.
    <br>
     [![forthebadge](https://forthebadge.com/images/badges/built-for-aws.svg)](https://forthebadge.com)
    <br>
     ![Static Badge](https://img.shields.io/badge/Technology-Terraform-9370DB)
    <br>

    </p>
</p>    

<br>

### Table of contents

**1 [About the Project](#about-the-project)**<br>
**2 [General Preview](#general-preview)**<br>
**3 [Technical](#technical)**<br>
**4 [Work in Progress](#work-in-progress)**<br>
**5 [Contributing](#contributing)**<br>
**6 [Versions](#versions)**<br>
**7 [Contributors](#contributors)**<br>

:point_down: :point_down: :point_down: :point_down: :point_down:


<hr>

## About the app

A template that can deploy a Secure and Scalable three-tier Architecture application on AWS with Terraform which can be edited to suit the specific application. 

<hr>

## General Preview
#### About Three-Tier Architecture of the app

Some text...

##### Presentation Layer:
Some text...

##### Application Layer:
Some text...

##### Data Layer:
Some text...



<hr>

## Technical

### Permissions

1. Internet

<hr>

### TECHNICAL

#### How to Execute the Script (Project)

**1. Required to run project:**
       ` - Provider version of 5.9.0. Provider is (https://registry.terraform.io/hashicorp/aws)[You can read this to set it up.](www.sth)
         - Have AWS CLI installed.
         - Have Terraform installed.
        `

**2. Clone this repository :**
 
         `git clone https://github.com/SammyBloom/Scalable-Secure-Web-Application-Architecture.git`
         
**3. Open Project in Text Editor (Visual Studio Code)**

**4. Preview the AWS infrastructures that will be created :**

        `terraform plan`

      Password: administration  

**5. Spin up the infrastructures :**

        `terraform apply -auto-approve`

      Password: administration    

**6. Test the application by entering the public IP address of the EC2 instance created. The index.html or index1.html should be rendered**        


#### Dependencies/Configurations/Installations
Terraform
AWS

## To Do List

- [x] Fix auto-scaling group not creating because it cannot find the aws_launch_template id that was created.
- [x] Add polish to the script to ensure all editing is only done in the variable.tf and dev.tfvars files.
- [x] Ensure that the userdata for both app and web runs and their respective index.html is rendered.


#### CONTRIBUTING
### Assets

[Resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

### Want to contribute?
I would/we'd love to have your help in making  **{this script (Deploy a Scalable and Secure Web Application on AWS using Terraform)}** better. The project is still very incomplete, but if there's an issue you'd like to see addressed sooner rather than later, let me(/us) know. 

For any concerns, please open an [issue](https://github.com/SammyBloom/Scalable-Secure-Web-Application-Architecture/issues), or JUST, [fork the project and send a pull request](https://github.com/SammyBloom/Scalable-Secure-Web-Application-Architecture/pulls). 

<hr>


## Versions 
* Version 1.0  DATE 25/7/2023


## Contributors
For personal feedback or questions feel free to contact me via the mail address, which is mentioned on my [Github profile](link (https://github.com/SammyBloom). If you have found any bugs or want to post a feature request please use the [bugtracker](https://github.com/SammyBloom/Scalable-Secure-Web-Application-Architecture/issues) to report them.


#### Developer
* e-mail: nwachiemi@gmail.com
* Twitter: [@SCNBloom](https://twitter.com/SCNBloom "SCNBloom")

