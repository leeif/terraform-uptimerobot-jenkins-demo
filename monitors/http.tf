resource "uptimerobot_monitor" "test_monitor" {
  friendly_name = "Test Monitor"
  type          = "http"
  url           = "http://test.com"
  interval      = 300
  alert_contact = [
    {
       id = "${var.alert_contact["Mail"]}"
    }
  ]
}