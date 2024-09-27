# Ejercicios de Infraestructura como Código (IaC) con Terraform en AWS

Este repositorio está destinado a la realización de ejercicios prácticos relacionados con la implementación de Infraestructura como Código (IaC) utilizando **Terraform** en la nube de **Amazon Web Services (AWS)**.

## Descripción

El propósito de este repositorio es aprender y practicar conceptos clave de IaC en AWS, automatizando la creación, modificación y eliminación de recursos en la nube mediante Terraform. Aquí encontrarás varios ejemplos de configuraciones para crear infraestructura como:

- Máquinas virtuales (EC2)
- Balanceadores de carga (ELB/ALB)
- Redes (VPC, Subnets, Gateways)
- Bases de datos (RDS)
- Grupos de seguridad (Security Groups)
- Buckets de S3
- Y más.

Cada directorio contiene un ejercicio específico con su correspondiente configuración de Terraform.

## Requisitos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- [Terraform](https://www.terraform.io/downloads.html) >= v1.0
- Una cuenta de [AWS](https://aws.amazon.com/)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) configurado con las credenciales adecuadas.
- [Git](https://git-scm.com/) para clonar este repositorio.

## Configuración

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu-usuario/terraform-aws-exercises.git
   ```
2. Cambia al directorio del ejercicio que deseas realizar:
   ```bash
   cd terraform-aws-exercises/ejercicio-nombre
   ```
3. Inicializa el directorio de trabajo de Terraform:
   ```bash
   terraform init
   ```
4. Revisa el plan de ejecución para ver los recursos que se crearán:
   ```bash
   terraform plan
   ```
5. Aplica la configuración para crear los recursos en AWS:
   ```bash
   terraform apply
   ```
6. Para eliminar la infraestructura creada después de completar el ejercicio:
   ```bash
   terraform destroy
   ```

## Estructura del repositorio

Cada directorio dentro de este repositorio corresponde a un ejercicio específico. La estructura básica de cada ejercicio es la siguiente:

```bash
terraform-aws-exercises/
 │
 ├── ejercicio-1/
 │   ├── 1. parte1.tf     # Configuración principal parte1
 │   ├── 2. parte2.tf     # Configuración principal parte2
 │   ├── 2. parte(n).tf   # Configuración principal parte(n)
 │   ├── variables.tf     # Definición de variables
 │   ├── outputs.tf       # Definición de salidas
 │   └── README.md        # Explicación del ejercicio
 └── ...
```

## Recursos adicionales

    •	Documentación oficial de Terraform
    •	Documentación de AWS
    •	Terraform AWS Provider

## Contribuciones

Si deseas contribuir con nuevos ejercicios o mejoras a los existentes, por favor crea un fork del repositorio y envía un pull request con tus cambios.
