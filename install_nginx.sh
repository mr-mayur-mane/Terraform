#!/bin/bash

apt update
apt install nginx -y
systemctl enable nginx
systemctl start nginx

echo "<h1> This is my nginx page </h1>" > /var/www/html/index.html
