resource "aws_instance" "ec2_instance" {
  ami           = "ami-03a6eaae9938c858c" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
}