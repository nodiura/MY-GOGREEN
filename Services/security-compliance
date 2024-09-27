# services/security-compliance.tf
resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.project_name}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_waf_web_acl" "web_acl" {
  name        = "${var.project_name}-web-acl"
  metric_name = "WebACL"
  default_action {
    type = "ALLOW"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 1
    rule_id  = aws_waf_rule.sql_injection.id
  }
}