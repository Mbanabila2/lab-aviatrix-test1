#!/bin/bash
 sudo apt update -y && sudo apt upgrade -y 
 sudo apt install -y net-tools traceroute nginx 
 sudo systemctl enable nginx --now 
 sudo echo "<html><body><h3>welcome to site and its working</h3></body></html>" >>  /usr/share/nginx/html
