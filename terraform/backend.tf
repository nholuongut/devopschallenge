terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devopschallenge"
    storage_account_name = "devopschallengestorage"
    container_name       = "tfstate"
    key                  = "devopschallenge.terraform.tfstate"
  }
}
