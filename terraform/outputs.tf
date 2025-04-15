output "container_app_url" {
  description = "Public URL of the deployed app"
  value       = azurerm_container_app.app.latest_revision_fqdn
}
