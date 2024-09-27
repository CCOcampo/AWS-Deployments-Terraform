## Proyecto Terraform en AWS

Este proyecto usa Terraform para crear una infraestructura básica en AWS.

### Características

- Crea una VPC y una subred pública.
- Despliega una instancia EC2 con Apache.
- Permite acceso HTTP público.

### Requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado.
- Credenciales de [AWS CLI](https://aws.amazon.com/cli/) configuradas.

### Uso

1. Clona el repositorio.
2. Ejecuta los comandos:
   ```bash
   terraform init
   terraform apply
   terraform apply
   ```

### Salida

La IP pública de la instancia EC2 se mostrará al finalizar la ejecución.

### Limpieza

Para eliminar los recursos creados:

```bash
  terraform destroy
```
