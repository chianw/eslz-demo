data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "v6.0.0" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  default_location = "SouthEastAsia"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name
  library_path   = "${path.root}/lib"

  custom_landing_zones = {
    "${var.root_id}-pmx-1" = {
      display_name               = "${upper(var.root_id)} PMX 1"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "singtelpmx"
        parameters     = {
		  "Deny-Resource-Locations": {
			"listOfAllowedLocations": [
			  "eastus",
			  "eastus2",
			  "westus",
			  "northcentralus",
			  "southcentralus",
              "southeastasia"
			]
		  },
		  "Enforce-RG-Tags": {
			"Owner": "Singtel",
            "Department": "Production"
		  }                           
        }
        access_control = {}
      }
    }
    "${var.root_id}-pmx-2" = {
      display_name               = "${upper(var.root_id)} PMX 2"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "singtelpmx"
        parameters = {
		  "Deny-Resource-Locations": {
			"listOfAllowedLocations": [
			  "eastus",
			  "eastus2",
			  "westus",
			  "northcentralus",
			  "southcentralus",
              "southeastasia"
			]
		  },
		  "Enforce-RG-Tags": {
			"Owner": "Singtel",
            "Department": "Demo"
		  }                                  
        }
        access_control = {}
      }
    }
  }
}