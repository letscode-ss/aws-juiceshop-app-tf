ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file ~/.ssh/id_rsa -u ec2-user nginx.yml

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file ~/.ssh/id_rsa -u ec2-user app.yml
