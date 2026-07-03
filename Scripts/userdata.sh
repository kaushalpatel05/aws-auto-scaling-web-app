#!/bin/bash

dnf -y update

dnf -y install httpd

systemctl enable --now httpd

echo "<h1>AWS Auto Scaling Web App</h1>" > /var/www/html/index.html