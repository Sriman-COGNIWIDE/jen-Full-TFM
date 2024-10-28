output "nlb_dns" {
  value       = aws_lb.nlb.dns_name
  description = "DNS of the nlb that is created"
}