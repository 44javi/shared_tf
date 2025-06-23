output "container_app_environment_id" {
  value = azurerm_container_app_environment.this.id
  description = "The ID of the Container App Environment"
}

output "container_app_environment_static_ip" {
  value = azurerm_container_app_environment.this.static_ip_address
}