region                = "us-east-1"

vpc_cidr              = "10.0.0.0/16"

public_subnet_1_cidr  = "10.0.1.0/24"
public_subnet_2_cidr  = "10.0.2.0/24"

private_subnet_1_cidr = "10.0.3.0/24"
private_subnet_2_cidr = "10.0.4.0/24"

db_username           = "admin"
db_password           = "YourStrongPassword123!"

instance_type         = "t3.micro"

ami_id                = "ami-0c55b159cbfafe1f0"  # Example: Amazon Linux 2 in us-east-1
