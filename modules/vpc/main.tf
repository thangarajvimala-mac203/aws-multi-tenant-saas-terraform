resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = "mt-saas-vpc"
    } 
}

#Internet gateway
resource "aws_internet_gateway" igw {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "mt-saas-igw"
    }
}

#Public subnets
resource "aws_subnet" "public" {
    count = length(var.public_subnets)

    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.public_subnets[count.index]
    availability_zone       = var.azs[count.index]
    map_public_ip_on_launch = true

    tags = {
        Name = "mt-saas-public-${count.index}"
    } 

}

# Private App subnets
resource "aws_subnet" "private_app" {
    count   = length(var.private_app_subnets)   

    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.private_app_subnets[count.index]
    availability_zone = var.azs[count.index]

    tags = {
        Name = "mt-saas-private-app-${count.index}"
    }
}

# Private DB subnets

resource "aws_subnet" "private_db" {
    count = length(var.private_db_subnets)

    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.private_db_subnets[count.index]
    availability_zone       = var.azs[count.index]

    tags = {
        Name = "mt-saas-private-db-${count.index}"  
    }
}

# Public Route Table 
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id    

    tags = {
        Name = "mt-saas-public-rt"
    }
}

# Public Route to Internet gateway
resource "aws_route" "public_internet_access" {
    route_table_id          = aws_route_table.public.id
    destination_cidr_block  = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.igw.id
}

#Associate Pubic Route Table with Public subnets
resource "aws_route_table_association" "public" {
    count   = length(aws_subnet.public)

    subnet_id       = aws_subnet.public[count.index].id
    route_table_id  = aws_route_table.public.id
}
