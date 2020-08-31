resource "aws_key_pair" "deploykey" {
  key_name   = "deploykey"
  public_key = "${file("${var.PATH_PUBLICKEY}")}"
}

resource "aws_instance" "backend" {
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.deploykey.key_name}"
  count = 2

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-traffic.id]

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
    Name = "backend.${count.index}"
    tier = "app"
  }

}


resource "aws_instance" "frontend" {
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.deploykey.key_name}"
  count = 2

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-traffic.id]

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
    Name = "frontend.${count.index}"
    tier = "app"
  }
}

