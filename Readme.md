#terraform-ansible-juiceshop-example

This repo contain terraform and ansible code to provtion environment 


Prerequisite 
- ansible >= 2.8.5 should be installed.
- terraform >= 0.13.0 should be installed.
- aws account

Steps

1. Generate ssh key 

2. Run
terraform  init
terraform  plan 
terraform apply -auto-approve

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file ~/.ssh/id_rsa -u ec2-user web.yml

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file ~/.ssh/id_rsa -u ec2-user app.yml
