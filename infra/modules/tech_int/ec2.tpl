#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
sudo apt -y update
sudo apt -y install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt -y install net-tools
