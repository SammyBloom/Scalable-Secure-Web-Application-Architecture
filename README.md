# Scalable-Secure-Web-Application-Architecture



  <h3 align="center">Scalable-Secure-Web-Application-Architecture</h3>
  
  <p align="center">
    A 3-tier web application solution that is scalable and secure using AWS and Terraform.
    <br>
     [![forthebadge](https://forthebadge.com/images/badges/built-for-aws.svg)](https://forthebadge.com)
    <br>
     <img src="https://img.shields.io/badge/Technology-Terraform-9370DB" alt="Technology Terraform">
    <br>

    

<br>

## Table of contents

**1 [About the Project](#about-the-project)**<br>
**2 [General Preview](#general-preview)**<br>
**3 [Technical](#technical)**<br>
**4 [To Do List](#To-Do-List)**<br>
**5 [Contributing](#contributing)**<br>
**6 [Versions](#versions)**<br>
**7 [Contributors](#contributors)**<br>

:point_down: :point_down: :point_down: :point_down: :point_down:


<hr>

## About the app

A template that can deploy a Secure and Scalable three-tier Architecture application on AWS with Terraform which can be edited to suit the specific application. 

<hr>

## General Preview
### About Three-Tier Architecture of the app

A 3-tier application architecture is a modular client-server architecture that consists of a presentation tier, an application tier and a data tier. This architecture is best used when scalability and security of the web application is the focus. 

#### Presentation Layer/Tier:

This tier, which is built with HTML5, cascading style sheets (CSS) and JavaScript, is deployed to a computing device through a web browser or a web-based application. The presentation tier communicates with the other tiers through application program interface (API) calls. This is the layer/tier that users interact with; usually called the Frontend of a web application.

#### Application Layer/Tier:

The application tier, which may also be referred to as the logic tier, is written in a programming language such as Java, JavaScript, GO, PHP or other backend programming languages and contains the business logic that supports the application's core functions. The underlying application tier can either be hosted on distributed servers in the cloud or on a dedicated in-house server, depending on how much processing power the application requires. This is usually called the Backend of a web application

#### Data Layer/Tier:

The data tier consists of a database and a program for managing read and write access to a database. This tier may also be referred to as the storage tier and can be hosted on-premises or in the cloud. Popular database systems for managing read/write access include MySQL, PostgreSQL, Microsoft SQL Server and MongoDB.

<hr>

## Technical

### Permissions

1. Internet

### TECHNICAL

#### How to Execute the Script (Project)

**1. Required to run project:**
        - Provider version of 5.9.0. Provider is (https://registry.terraform.io/hashicorp/aws)[You can read this to set it up.](www.sth)
        - Have AWS CLI installed.
        - Have Terraform installed.
        

**2. Clone this repository :**
 
         `git clone https://github.com/SammyBloom/Scalable-Secure-Web-Application-Architecture.git`
         
**3. Open Project in Text Editor (Visual Studio Code)**

**4. Preview the AWS infrastructures that will be created :**
        - Password: administration 

        `terraform plan`

**5. Spin up the infrastructures :**
        - Password: administration 

        `terraform apply -auto-approve`  

**6. Test the application by entering the public IP address of the EC2 instance created. The index.html or index1.html should be rendered**        

<hr>

#### Dependencies/Configurations/Installations
Terraform
AWS

<hr>

## To Do List

- [x] Fix auto-scaling group not creating because it cannot find the aws_launch_template id that was created.
- [x] Add polish to the script to ensure all editing is only done in the variable.tf and dev.tfvars files.
- [x] Ensure that the userdata for both app and web runs and their respective index.html is rendered.

<hr>

## CONTRIBUTING
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

