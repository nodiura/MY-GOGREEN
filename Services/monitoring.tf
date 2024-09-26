# services/monitoring.tf
resource "aws_cloudwatch_metric_alarm" "http_error_alarm" {
  alarm_name          = "${var.project_name}-http-error-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name        = "5XXError"
  namespace          = "AWS/ApiGateway"
  period             = 60
  statistic          = "Sum"
  threshold          = 1
  alarm_actions = [
    aws_sns_topic.notification_topic.arn,
  ]
}
resource "aws_sns_topic" "notification_topic" {
  name = "${var.project_name}-notifications"
}