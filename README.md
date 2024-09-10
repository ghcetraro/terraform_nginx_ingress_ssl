# README

This repository is used to install nginx ingress with cert-manager in eks of aws with terraform

## Locals

	The missing information of the external components required needs to be completed
```
    id                         = " " # to fill 
    endpoint                   = " " # to fill 
    certificate_authority_data = " " # to fill 
    oidc_issuer_url            = " " # to fill

    zone_id = " " # to fill
    name    = " " # to fill 
```

### *Terraform Individual Variables*

```
	cert-manager/terraform.tfvars
	nginx-ingress/terraform.tfvars
```

## Running

To run the following scripts, you will need to have ADMIN privileges.

  Following 3 commands need to be executed for every deployment
``` 
  terraform init 
  terraform plan 
  terraform apply 
```

## Pre-requisites

- Terraform CLI is [installed](https://learn.hashicorp.com/tutorials/terraform/install-cli).  
- AWS CLI [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).  

## Terraform Scripts In
``` 
	cert-manager/
	nginx-ingress/
``` 

## Resources

Resources that are going to be deployed  
```
	AWS  
		alb clasic  
		route53  

	EKS
		secrets
		configmap
		service account
		role
		role attachment
```

## Dependencies
	
	VPC
	EKS
	ROUTE53

