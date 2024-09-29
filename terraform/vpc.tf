resource "aws_vpc" "aws_vpc" {
 cidr_block = var.vpc_cidr_block
 tags = {
    Name = var.Name_vpc ,
    created-by="Yousef"
  }
}

resource "aws_subnet" "aws_subnet" {
  
  vpc_id = aws_vpc.aws_vpc.id
  cidr_block =var.subnet_cidr_block
  tags = {
    Name = var.Name_subnet ,
    created-by="Yousef"
  }

}


# module "aws_vpc" {
#   source = "./modules/aws_vpc"
#   subnet_cidr_block = var.subnet_cidr_block
#   vpc_cidr_block = var.vpc_cidr_block
#   Name_vpc = var.Name_vpc
#   Name_subnet = var.Name_subnet

# }