# vpc 
  vpc_Name = "test-vpc"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnets_cidr = ["10.0.1.0/24","10.0.2.0/24"]
  availability_Zones_subnet = ["eu-north-1a","eu-north-1b"]   
#ec2
  ec2_Name = ["docker-agent","jenkins-agent"]
  ami_id = "ami-08eb150f611ca277f"   
  key_Name = "private_key"
  instance_type = "t3.micro"   