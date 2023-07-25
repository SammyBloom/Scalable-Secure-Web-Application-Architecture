#!/bin/bash 
apt-get update -y
apt-get install httpd -y
echo "<h1>Web data is working!!!</h1>" >> /var/www/html/index1.html
systemctl enable httpd
systemctl start httpd