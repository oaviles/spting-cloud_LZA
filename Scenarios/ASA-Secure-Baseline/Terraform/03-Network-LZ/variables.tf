##################################################
### Network Spoke Variables
##################################################

variable "name_prefix" {
    type= string
    description = "This prefix will be used when naming resources"

}

variable "location" {
    type = string    
    description = "Deployment region (ex. East US), for supported regions see https://docs.microsoft.com/en-us/azure/spring-apps/faq?pivots=programming-language-java#in-which-regions-is-azure-spring-apps-basicstandard-tier-available"
} 

variable "tags" {
    type        = map 
    default     = { 
        project = "ASA-Accelerator"
    }
}

# Spoke VNET
variable "spoke_vnet_addr_prefix" {
    type        = string 
    description = "Spoke VNET prefix"
    default     = "10.1.0.0/16"
}

# Spoke Subnets - use the TFVars file if you want to modify these
variable "springboot-service-subnet-name" {
    type        = string
    description = "Spring Apps Service Subnet"
    default     = "snet-runtime"
}
variable "springboot-service-subnet-addr" {
    type        = string
    description = "Spring Apps CIDR Subnet"
    default     = "10.1.0.0/24"
}
variable "springboot-apps-subnet-name" {
    type        = string
    description = "Spring Apps Service Subnet"
    default     = "snet-app"
}
variable "springboot-apps-subnet-addr" {
    type        = string
    description = "Spring Apps Apps CIDR Subnet"
    default     = "10.1.1.0/24"
}

variable "springboot-support-subnet-name" {
    type        = string
    description = "Spring Apps Private Link Subnet Name"
    default     = "snet-support"
}

variable "springboot-support-subnet-addr" {
    type        = string
    description = "Spring Apps Private Link Subnet"
    default     = "10.1.2.0/24"
}

variable "springboot-data-subnet-name" {
    type        = string
    description = "Spring Apps Data Services Subnet"
    default     = "snet-data"
}
variable "springboot-data-subnet-addr" {
    type        = string
    description = "Spring Apps Data Services Subnet"
    default     = "10.1.3.0/24"
}

variable "shared-subnet-name" {
    type        = string
    description = "Shared Services Subnet Name"
    default     = "snet-shared"
}
variable "shared-subnet-addr" {
    type        = string
    description = "Shared Services Subnet Address Range"
    default     = "10.1.4.0/24"
}

variable "appgw-subnet-name" {
    type        = string
    description = "App Gateway Subnet Name"
    default     = "snet-agw"
}
variable "appgw-subnet-addr" {
    type        = string
    description = "App Gateway Subnet Address"
    default     = "10.1.5.0/24"
}





variable "springapps_dnszone_name" {
    type = string
    description = "The SpringApps Private DNS Zone name"
    default = "private.azuremicroservices.io"
}

variable "keyvault_dnszone_name" {
    type = string
    description = "The Azure KeyVault Private DNS Zone name"
    default = "privatelink.vaultcore.azure.net"
}

## Needed for the Peering
variable "Hub_Vnet_Name" {
    type        = string 
    description = "The Name of the Hub Vnet - This is needed for the creating the Peering"
}

variable "Hub_Vnet_RG" {
    type        = string 
    description = "The Resource Group of the Hub Vnet - This is needed for the creating the Peering"
}



