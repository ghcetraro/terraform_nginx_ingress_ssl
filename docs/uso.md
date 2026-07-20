# Uso y despliegue

## Descripción

Ingress NGINX con TLS automático (cert-manager) en EKS — dos módulos Terraform

Dos carpetas Terraform (`nginx-ingress/` y `cert-manager/`) para instalar el controller y emitir certificados de forma repetible.

## Requisitos

- Terraform 1.x
- AWS CLI con permisos adecuados
- Para módulos EKS: cluster existente y acceso de API

## Variables

Usá siempre la plantilla **`terraform.tfvars.example`**. No subas `terraform.tfvars` ni el state.

### Módulo `nginx-ingress/`

```bash
cd nginx-ingress
cp terraform.tfvars.example terraform.tfvars
# Completar variables y locals según tu cuenta/cluster

aws sso login --profile <tu-profile>   # o credenciales equivalentes
terraform init
terraform plan
terraform apply
```

### Módulo `cert-manager/`

```bash
cd cert-manager
cp terraform.tfvars.example terraform.tfvars
# Completar variables y locals según tu cuenta/cluster

aws sso login --profile <tu-profile>   # o credenciales equivalentes
terraform init
terraform plan
terraform apply
```


## Post-apply

Revisá outputs del módulo y recursos en la consola AWS / `kubectl` según corresponda.

## Seguridad

Ver [SECURITY.md](../SECURITY.md).
