variable "vnets" {
  type = map(object({
    location            = string
    address_space       = list(string)
    resource_group_name = string
    subnets = list(object({
      address_prefix = string
    }))
  }))
}


###DDOS PLAN####

variable "ddos_protection_plan_name" {
  type        = string
  default     = "ddosplan01"
  description = "DDOS Protection plan"
}
variable "ddos_protection_plan_enabled" {
  type        = bool
  description = "Enable DDoS protection plan."
  default     = true
}