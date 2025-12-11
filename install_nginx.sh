#!/bin/bash

apt update -y

apt install nginx -y

systemctl enable nginx
systemctl start nginx

echo "<h1> This is my nginx home page </h1>" > /var/www/html/index.html
echo "<h2> This is nginx hosting page </h2>" > /var/www/html/index.html"
