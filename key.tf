resource "aws_key_pair" "auth" {
  key_name   = "${var.key-name}"
  public_key = "${file(var.public-key-path)}"
}
