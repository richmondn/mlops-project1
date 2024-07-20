resource "azurerm_application_insights" "appi" {
  name                = "appi-${var.prefix}-${var.postfix}${var.env}"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = "web"

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "logwksp" {
  name                = "logwksp-${var.prefix}-${var.postfix}${var.env}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Free"
  retention_in_days   = 7
}

resource "azurerm_application_insights" "appi" {
  name                = "appi-${var.prefix}-${var.postfix}${var.env}"
  location            = var.location
  resource_group_name = var.rg_name
  workspace_id        = azurerm_log_analytics_workspace.logwksp.id
  application_type    = "web"
}