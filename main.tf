variable "vm_identity" {
  description = "system assigned managed identity for the VMs"
  default = ["c1b1d62d-b4c0-4f13-981e-f921f643b54c"] // add VMs identities 
  
}


//This is to fetch the subscription id of the current subscription where terraform exceuted  
data "azurerm_subscription" "current" {
    
}


// This will run based on the number of items in the vm_identity list variable 
resource "azurerm_role_assignment" "add_vm_role" {
  count                = length(var.vm_identity)
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"
  role_definition_name = "contributor"
  principal_id         = var.vm_identity[count.index]
}
