#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo docker pull bkimminich/juice-shop
sudo docker run -d -p 3000:3000 bkimminich/juice-shop
