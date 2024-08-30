terraform {
  required_version = ">= 1.9.2"
  required_providers {
    # TODO: Ensure all required providers are listed here.
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.94.0, <= 4.0.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1, <= 3.6.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "singteldemorg"
    storage_account_name = "singteltfstate1"
    container_name       = "eslztfstate"
    key                  = "singteleslz.tfstate"
  }
}

# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Core resources".
provider "azurerm" {
  features {}
}

# Declare an aliased provider block using your preferred configuration.
# This will be used for the deployment of all "Connectivity resources" to the specified `subscription_id`.
/*
provider "azurerm" {
  alias = "connectivity"
  # subscription_id = "c312dff9-6ba2-4fff-adeb-a78ea07136ea"
  features {}
}

# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Management resources" to the specified `subscription_id`.
# Log Analytics Workspace, AMPLS and perhaps Sentinel should be covered by this provider

provider "azurerm" {
  alias = "management"
  # subscription_id = "0de4142b-f18d-4e8a-9a29-ed9411d65409"
  features {}
}
*/