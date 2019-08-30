resource "uptimerobot_monitor" "test_monitor_1" {
  friendly_name = "Test Monitor"
  type          = "http"
  url           = "http://test.com/1"
  interval      = 300
  alert_contact = [
    {
       id = "${var.alert_contact["Mail"]}"
    }
  ]
}

resource "uptimerobot_monitor" "test_monitor_2" {
  friendly_name = "Test Monitor"
  type          = "http"
  url           = "http://test2.com/2"
  interval      = 300
  alert_contact = [
    {
       id = "${var.alert_contact["Mail"]}"
    }
  ]
}