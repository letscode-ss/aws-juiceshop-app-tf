

resource "aws_instance" "app" {
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.sshkey.key_name}"
  count           = "${var.app_instance_count}"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.main-sg.id]

  /* Enable this if you don't want to use Ansible
  provisioner "file" {
    source      = "bash/app.sh"
    destination = "/tmp/app.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/app.sh",
      "/tmp/app.sh",
      ""
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = "${var.SSH_USER}"
    private_key = "${file("${var.PATH_PRIVATEKEY}")}"
  }
  */

  tags = {
    Name = "${var.project_name}-app-${count.index}"
    tier = "app"
  }

}


resource "aws_instance" "web" {
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.sshkey.key_name}"
  count           = "${var.web_instance_count}"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.main-sg.id]

  /* Enable this if you don't want to use Ansible

  provisioner "file" {
    source      = "bash/web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "/tmp/web.sh",
      ""
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = "${var.SSH_USER}"
    private_key = "${file("${var.PATH_PRIVATEKEY}")}"
  }
  */

  tags = {
    Name = "${var.project_name}-web-${count.index}"
    tier = "app"
  }
}

