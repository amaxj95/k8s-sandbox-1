resource "aws_vpc" "main" {
    #provision network resources ~ 65,000 IP addresses
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main"
    }
}