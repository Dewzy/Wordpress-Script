#!/usr/bin/env bash

echo "STARTING WORDPRESS INTALL"

# Download compressed wordpress files
wget http://wordpress.org/latest.tar.gz

# Unzip the files
tar -xzvf latest.tar.gz

# Copy files to /var/www/html
cp -avr wordpress/* /var/www/html

# Make a directory for the content
mkdir /var/www/html/wp-content/uploads

# Modify the permissions
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html

# Change back to the directory /var/www/html/
cd /var/www/html/

# Rename the file 
mv wp-config-sample.php wp-config.php

# Change the firewall settings for http and https
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
