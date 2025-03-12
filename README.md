# MUNDO-SE-PIN-FINAL

Este proyecto está dividido en dos carpetas principales: `1.aws-eks` y `2.application`. A continuación, se describe el propósito y funcionamiento de cada una de estas carpetas.

## 1. aws-eks

Esta carpeta contiene la configuración necesaria para desplegar una infraestructura de Amazon EKS (Elastic Kubernetes Service) utilizando Terraform. Los archivos dentro de esta carpeta están organizados de la siguiente manera:

- **eks-cluster.tf**: Define el módulo de EKS, incluyendo la configuración del cluster y los grupos de nodos gestionados.
- **main.tf**: Configura los proveedores de AWS y Kubernetes, y define recursos como la autenticación del cluster EKS.
- **outputs.tf**: Define las salidas de Terraform, proporcionando información útil sobre el cluster EKS, como el endpoint del cluster y el ID del grupo de seguridad.
- **terraform.tf**: Especifica los proveedores requeridos y la versión de Terraform necesaria para este proyecto.
- **terraform.tfvars**: Contiene los valores de las variables utilizadas en la configuración de Terraform, como la región de AWS, el nombre del cluster, y las credenciales de Grafana.
- **variables.tf**: Define las variables utilizadas en la configuración de Terraform, incluyendo variables transversales, de la VPC y del cluster EKS.
- **vpc.tf**: Define el módulo de VPC (Virtual Private Cloud), configurando subredes públicas y privadas, y otros recursos de red necesarios para el cluster EKS.

## 2. application

Esta carpeta contiene la configuración de la aplicación que se desplegará en el cluster EKS. Está organizada de la siguiente manera:

- **kubernetes.tf**: Configura el proveedor de Kubernetes y define el namespace de "monitoring". También incluye los módulos para desplegar NGINX y herramientas de monitoreo como Grafana y Prometheus.
- **modules/**: Contiene subcarpetas para diferentes componentes de la aplicación:
  - **monitoring/**: Incluye la configuración para desplegar herramientas de monitoreo.
    - **main.tf**: Define los recursos de Helm para desplegar Grafana y Prometheus en el namespace especificado.
    - **variables.tf**: Define las variables necesarias para la configuración de monitoreo, como el namespace de Kubernetes y las credenciales de Grafana.
  - **ngnx/**: Incluye la configuración para desplegar un servidor NGINX.
    - **deployment.tf**: Define el recurso de despliegue de Kubernetes para NGINX, especificando el número de réplicas, la imagen del contenedor y los recursos solicitados.
    - **service.tf**: Define el recurso de servicio de Kubernetes para NGINX, configurando un LoadBalancer para exponer el servicio.
    - **variables.tf**: Define las variables necesarias para la configuración de NGINX, como el namespace de Kubernetes.

Este proyecto utiliza Terraform para gestionar la infraestructura y Kubernetes para orquestar los contenedores de la aplicación. La configuración está diseñada para ser modular y reutilizable, facilitando el despliegue y la gestión de la infraestructura y la aplicación.
