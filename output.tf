output "ELB" {
  value = aws_elb.main-elb.dns_name
}

output "instances_ids" {
  value = "${aws_instance.web.*.id}"
}
