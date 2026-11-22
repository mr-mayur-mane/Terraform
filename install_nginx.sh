#!/bin/bash

sudo apt update 
sudo apy install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> Nginx is installed via terraform" | sudo tee /var/www/index.html