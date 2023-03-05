resource "aws_instance" "simple-instance" {
  ami           = "ami-0a561b65214a47cac"
  instance_type = "t2.micro"

  tags = {
    Name = "Hello World"
  }
}
