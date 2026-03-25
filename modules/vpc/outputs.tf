output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnets" {
    value = aws_subnet.public[*].id
}

output "private_app_subnets" {
    value = aws_subnet.private_app[*].id
}

output "private_db_subnets" {
    value = aws_subnet.private_db[*].id
}

output "public_route_table_id" {
    value   = aws_route_table.public.id
}