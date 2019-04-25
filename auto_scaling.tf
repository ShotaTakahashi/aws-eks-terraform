resource "aws_autoscaling_group" "designing-distributed-systems" {
  desired_capacity     = 2
  launch_configuration = "${aws_launch_configuration.designing-distributed-systems.id}"
  max_size             = 2
  min_size             = 1
  name                 = "terraform-eks"
  vpc_zone_identifier  = ["${aws_subnet.designing-distributed-systems.*.id}"]

  tag {
    key                 = "Name"
    value               = "terraform-eks"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}