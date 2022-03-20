locals {
  strg_acct = var.strg_acct
  rg_name = var.my_rg
  my_loc   = var.my_loc
}

resource "azurerm_resource_group" "my_rg" {
  name     = local.rg_name
  location = local.my_loc
}

resource "azurerm_app_service_plan" "service_plan" {
  name                = "azure-functions-test-service-plan"
  location            = local.my_loc
  resource_group_name = local.rg_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}


resource "azurerm_function_app" "functionapp" {
  name                       = "terrafunctionapp"
  location                   = local.my_loc
  resource_group_name        = local.rg_name
  app_service_plan_id = azurerm_app_service_plan.service_plan.id
  storage_account_name       = local.strg_acct
}