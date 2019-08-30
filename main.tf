variable "api_key" {
}


provider "uptimerobot" {
  api_key = "${var.api_key}"
}

# load alert contact
module "alert_contact" {
  source = "./alert-contact"
}

module "monitors" {
  source = "./monitors"
  alert_contact = {
    Mail  = "${module.alert_contact.all["Mail"]}"
  }
}