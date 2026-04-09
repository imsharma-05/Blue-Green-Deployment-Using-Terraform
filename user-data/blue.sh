#!/bin/bash
yum install -y httpd
echo "Blue Version" > /var/www/html/index.html
systemctl start httpd