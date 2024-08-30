### Pre-requisites:
- create service principal with required permissions
- create storage account to store tfstate
- perform az login on terminal with the service principal credentials and create the following environment variables, note the ARM_SUBSCRIPTION should be the one containing the storage account for tfstate file

export ARM_CLIENT_ID="xxx"
export ARM_CLIENT_SECRET="xxx"
export ARM_TENANT_ID="xxx"
export ARM_SUBSCRIPTION_ID="xxx"

### Authenticating with service principal in terraform 
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret

