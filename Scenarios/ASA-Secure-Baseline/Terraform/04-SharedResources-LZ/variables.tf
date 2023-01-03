##################################################
### Shared Resources variables
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


# Info about Precreated Hub and Spoke VNETS

variable "Hub_Vnet_Name" {
    type = string    
    description = "The name of the Hub Vnet"
} 

variable "Hub_Vnet_RG" {
    type = string    
    description = "The name of the Hub RG"
}


# Subnets Info

# Spoke Subnets - use the TFVars file if you want to modify these

variable "shared-subnet-name" {
    type        = string
    description = "Shared Services Subnet Name"
    default     = "snet-shared"
}

variable "springboot-support-subnet-name" {
    type        = string
    description = "Spring Apps Private Link Subnet Name"
    default     = "snet-support"
}

# Jump host module
variable "jump_host_private_ip_addr" {
    type        = string 
    description = "Azure Jump Host Address"
    default     = "10.1.4.5"
}
variable "jump_host_vm_size" {
    type        = string 
    description = "Azure Jump Host VM SKU"
    default     = "Standard_DS3_v2"
}
variable "jump_host_admin_username" {
    type        = string 
    description = "Admin Username, used by Jump Host"
}
variable "jump_host_password" {
    sensitive   = true
    type        = string
    description = "Admin Password, used by Jump Host"

}

# For Azure KeyVault
variable "keyvault_dnszone_name" {
    type = string
    description = "The Azure KeyVault Private DNS Zone name"
    default = "privatelink.vaultcore.azure.net"
}
