output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_a_id" {
  value = aws_subnet.public_a.id
}

output "public_b_id" {
  value = aws_subnet.public_b.id
}

output "private_a_id" {
  value = aws_subnet.private_a.id
}

output "private_b_id" {
  value = aws_subnet.private_b.id
}