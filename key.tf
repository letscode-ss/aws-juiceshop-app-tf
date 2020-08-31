resource "aws_key_pair" "deploykey" {
  key_name   = "deploykey"
  public_key = "${file("${var.PATH_PUBLICKEY}")}"
}