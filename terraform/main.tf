provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "logs" {
  name                = "${var.app_name}-logs"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "env" {
  name                       = "${var.app_name}-env"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.main.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
}

resource "azurerm_container_app" "app" {
  name                          = var.app_name
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.location

  template {
    container {
      name   = var.app_name
      image  = var.docker_image
      cpu    = 0.5
      memory = "1.0Gi"

      ports {
        port     = 8080
        protocol = "TCP"
      }
    }

    ingress {
      external_enabled = true
      target_port      = 8080
      transport        = "auto"
    }
  }

  identity {
    type = "SystemAssigned"
  }
}
