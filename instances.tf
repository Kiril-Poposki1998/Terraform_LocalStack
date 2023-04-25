resource "aws_instance" "instance-1" {
  instance_type = "t3.micro"
  ami           = var.ami_id
  subnet_id     = aws_subnet.main.id
  private_ip    = "10.0.1.2"

  tags = {
    "Name" = "instance-1"
  }
}