output "Load_Balancer_dns" {
  value       = aws_lb.k8s-alb.dns_name
}
output "Load_Balancer_zone_id" {
  value       = aws_lb.k8s-alb.zone_id
}
output "pmt_Load_Balancer_dns" {
  value       = aws_lb.pmt-alb.dns_name
}
output "graf_Load_Balancer_dns" {
  value       = aws_lb.graf-alb.dns_name
}