output "nlb_dns" {
  value       = aws_lb.nlb.dns_name
  description = "dns of the nlb"
}