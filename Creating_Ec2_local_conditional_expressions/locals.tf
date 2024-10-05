locals {
  count_condition = var.Lifecycle == "devl-csdl" ? 1 : 0
  common_tags = {
    Name            = "Moazma_first_ec2"
    EMM_alert_group = "demo-application-cloudWatch-alert"
    Lifecycle       = "${var.Lifecycle}"
    CostCenter      = 0780
  }
}