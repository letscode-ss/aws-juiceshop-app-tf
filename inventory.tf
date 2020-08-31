data "template_file" "inventory" {
  template = "${file("inventory.cfg")}"
  vars = {
      web_public = "${join("\n", aws_instance.frontend.*.public_ip)}"
      app_public = "${join("\n", aws_instance.backend.*.public_ip)}"
  }
}

resource "null_resource" "inventory-hosts" {
  triggers = {
    template_rendered = "${data.template_file.inventory.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.inventory.rendered}' > playbook/inventory"
  }
}
