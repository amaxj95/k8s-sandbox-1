# provide internet services to the VPC 
resource "aws-internet_gateway" "gateway" {
    vpc_id = aws_vpc.main.vpc_id

    tags = {
        Name = "gateway"
    }
}