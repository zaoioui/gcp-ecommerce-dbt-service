# GCP Serverless ELT Pipeline with dbt

This project implements an end-to-end serverless ELT pipeline on Google Cloud Platform.

## Architecture

```text
GCS → Pub/Sub → Eventarc → Cloud Workflows → BigQuery (raw)
                                      ↓
                                   dbt (Cloud Run)
                                      ↓
                             BigQuery (analytics)
```

## Stack

* Google Cloud Storage (GCS)
* Pub/Sub & Eventarc
* Cloud Workflows
* BigQuery
* dbt (BigQuery)
* Cloud Run
* Secret Manager
* Cloud Build (CI/CD)
* Terraform (Infrastructure as Code)

## Features

* Event-driven data ingestion from GCS to BigQuery
* Data transformation using dbt (staging and analytics models)
* dbt execution exposed via a Cloud Run endpoint
* Secure credential management with Secret Manager
* Automated deployment with Cloud Build and GitHub

## Endpoints

```bash
/           → health check  
/run-dbt    → trigger dbt run  
```

## Deployment

```bash
# Deploy infrastructure
cd infra
terraform init
terraform apply

# Deploy dbt service
cd ../dbt-etl
gcloud builds submit --config cloudbuild.yaml .
```
