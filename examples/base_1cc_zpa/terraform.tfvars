## This is only a sample terraform.tfvars file.
## Uncomment and change the below variables according to your specific environment


#####################################################################################################################
##### ZPA/Route 53 specific variables #####
#####################################################################################################################
## *** Provide the domain names you want Route53 to redirect to Cloud Connector for ZPA interception. Only applicable for base + zpa or zpa_enabled = true
##     deployment types where Route53 subnets, Resolver Rules, and Outbound Endpoints are being created. Two example domains are populated to show the 
##     mapping structure and syntax. ZPA Module will read through each to create a resolver rule per domain_name entry. Ucomment domain_names variable and
##     add any additional appsegXX mappings as needed.

#domain_names = {
#  appseg01 = { domain_name = "app1.com" }
#  appseg02 = { domain_name = "app2.com" }
#}


#####################################################################################################################
##### Variables 1-10 are populated automically if terraform is ran via ZSEC bash script.   ##### 
##### Modifying the variables in this file will override any inputs from ZSEC             #####
#####################################################################################################################


#####################################################################################################################
##### Cloud Init Userdata Provisioning variables  #####
#####################################################################################################################

## 1. Zscaler Cloud Connector Provisioning URL E.g. connector.zscaler.net/api/v1/provUrl?name=aws_prov_url

#cc_vm_prov_url                           = "connector.zscaler.net/api/v1/provUrl?name=aws_prov_url"

## 2. AWS Secrets Manager Secret Name from Secrets Manager E.g ZS/CC/credentials

#secret_name                              =  "ZS/CC/credentials/aws_cc_secret_name"

## 3. Cloud Connector cloud init provisioning listener port. This is required for GWLB and Health Probe deployments. 
## Uncomment and set custom probe port to a single value of 80 or any number between 1024-65535. Default is 0/null.

#http_probe_port                          = 50000


#####################################################################################################################
##### Custom variables. Only change if required for your environment  #####
#####################################################################################################################

## 4. AWS region where Cloud Connector resources will be deployed. This environment variable is automatically populated if running ZSEC script
##    and thus will override any value set here. Only uncomment and set this value if you are deploying terraform standalone. (Default: us-west-2)

#aws_region                          = "us-west-2"


## 5. Cloud Connector AWS EC2 Instance size selection. Uncomment ccvm_instance_type line with desired vm size to change.
##    (Default: m5.large)

#ccvm_instance_type                       = "t3.medium"
#ccvm_instance_type                       = "m5.large"
#ccvm_instance_type                       = "c5.large"
#ccvm_instance_type                       = "c5a.large"
#ccvm_instance_type                       = "m5.2xlarge"
#ccvm_instance_type                       = "c5.2xlarge"
#ccvm_instance_type                       = "m5.4xlarge"
#ccvm_instance_type                       = "c5.4xlarge"


## 6. Cloud Connector Instance size selection. Uncomment cc_instance_size line with desired vm size to change
##    (Default: "small") 
##    **** NOTE - There is a dependency between ccvm_instance_type and cc_instance_size selections ****
##    If size = "small" any supported EC2 instance type can be deployed, but "m5/c5.large" is ideal
##    If size = "medium" only 2xlarge and up EC2 instance types can be deployed
##    If size = "large" only 4xlarge EC2 instane types can be deployed 
##    **** NOTE - medium and large cc_instance_size is only supported with GWLB deployments. Legacy HA/Lambda deployments must be small.

#cc_instance_size                         = "small"
#cc_instance_size                         = "medium"
#cc_instance_size                         = "large" 


## 7. IPv4 CIDR configured with VPC creation. Workload, Public, and Cloud Connector Subnets will be created based off this prefix
##    /24 subnets are created assuming this cidr is a /16. You may need to edit cidr_block values for subnet creations if
##    desired for smaller or larger subnets. (Default: "10.1.0.0/16")

#vpc_cidr                                 = "10.1.0.0/16"


## 8. Number of Workload VMs to be provisioned in the workload subnet. Only limitation is available IP space
##    in subnet configuration. Only applicable for "base" deployment types. Default workload subnet is /24 so 250 max

#workload_count                               = 2


## 9. Tag attribute "Owner" assigned to all resoure creation. (Default: "zscc-admin")

#owner_tag                                = "username@company.com"


## 10. By default, Cloud Connectors are configured with a callhome IAM policy enabled. This is recommended for production deployments
##     The policy creation itself does not provide any authentication/authorization access. IAM details are still required to be provided
##     to Zscaler in order to establish a trust relationship. Uncomment if you do not want this policy created. (Default: true)

#cc_callhome_enabled                       = false




