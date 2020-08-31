data "template_file" "inventory" {
  template = "${file("inventory.cfg")}"
  vars = {
      web_public = "${join("\n", aws_instance.web.*.public_ip)}"
      app_public = "${join("\n", aws_instance.app.*.public_ip)}"
  }
}

resource "null_resource" "inventory-hosts" {
  triggers = {
    template_rendered = "${data.template_file.inventory.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.inventory.rendered}' > playbook/inventory"
  }
  provisioner "local-exec" {
    command = "sleep 15 && ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i playbook/inventory --key-file ${var.PATH_PRIVATEKEY} -u ${var.SSH_USER} playbook/web.yml"
  }
  provisioner "local-exec" {
    command = "sleep 15 && ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i playbook/inventory --key-file ${var.PATH_PRIVATEKEY} -u ${var.SSH_USER} playbook/app.yml"
  }
}
