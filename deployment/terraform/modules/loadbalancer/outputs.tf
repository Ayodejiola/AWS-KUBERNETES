output "aws_alb_target_group_arn" {
  value = aws_alb_target_group.main.arn
}
output "aws_alb_dns" {
  value = aws_lb.main.dns_name
}
output "aws_alb_target_group_backend_arn" {
  value = aws_alb_target_group.backend.arn
}