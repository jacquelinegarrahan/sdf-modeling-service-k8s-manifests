# sdf-modeling-service-k8s-manifests
This repository holds Kubernetes resources for the for SDF-hosted modeling service.

## Components:

![component_diagram](files/Modeling_infra.darwio.png)

Notes:  
* MongoDB and MySQL will run as operators, likely in own Deployment...  
* The Docker images for the mongodb and mysql instances packaged with services 
* Helm deployment of MySQL has optional Prometheus metric exporter


| Component                       | Docker Image(s)              | LICENSE               |
|---------------------------------|------------------------------|-----------------------|
| Synchronous Snapshot Service    | (WIP)                        | SLAC Open             |
| Model DB                        | bitnami/mysql:8.0.29         | Apache 2.0            |
| Results DB                      | bitnami/mongodb:5.0.8,       | Apache 2.0            |
| Prefect Scheduling Service      | bitnami/postgresql:9.3.2     | Apache 2.0            |
|                                 | hasura/graphql-engine:v2.0.9 | Apache 2.0            |
|                                 | prefecthq/apollo:core-1.2.1  | Prefect Community 1.0 |
|                                 | prefecthq/ui:core-1.2.1      | Prefect Community 1.0 |
|                                 | prefecthq/server:core-1.2.1  | Prefect Community 1.0 |
|                                 | (agent & misc jobs)          | Prefect Community 1.0 |
|                                 | prefecthq/prefect:core-1.2.1 | Prefect Community 1.0 |
| Prefect Jobs                    | Flow-built images            | SLAC Open             |
| EPICS Output Service            | WIP                          | SLAC Open             |
| Logging Infra (Loki + Grafana?) | Existing sdf deployments     |                       |             
| Data Visualization Apps         | MISC w/ some common base     | SLAC Open             |


Notes:  
* MongoDB and MySQL will run as operators, likely in own Deployment...  
* Helm deployment of MySQL has optional Prometheus metric exporter