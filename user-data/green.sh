#!/bin/bash
yum install -y httpd
echo "Green Version" > /var/www/html/index.html
systemctl start httpd