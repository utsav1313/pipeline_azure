provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_rg" {
  name     = var.my_rg   
  location = "central india"
}

module "backend" {
  source  = "./modules/backend/"
  my_rg   = var.my_rg
  rg_name = azurerm_resource_group.my_rg.name
  my_loc  = azurerm_resource_group.my_rg.location

}
  module "demo"{
    source  = "./modules/frontend/"
    my_rg   = var.my_rg
    rg_name = azurerm_resource_group.my_rg.name
    my_loc  = azurerm_resource_group.my_rg.location
  }