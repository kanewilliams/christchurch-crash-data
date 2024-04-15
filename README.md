# Christchurch Crash and Traffic Data
This is my 2024 Data Engineering [Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) capstone project, consisting of New Zealand Crash Data joined with New Zealand Traffic Data.

Tools used: **Docker, Terraform, Mage, dbt, Google Cloud Platform (BigQuery, GCS, and Looker)**

## Problem Statement
For my data engineering course project, I wanted to combine two data sets:

 1) [NZ Crash Data from the Crash Analysis System (CAS)](https://catalogue.data.govt.nz/dataset/crash-analysis-system-cas-data5). The dataset contains information from New Zealand's crashes from 1-January-2000, and is updated monthly. It is curated by Waka Kotahi - the NZ Transport Agency. 

 2) [TMS (Traffic Management System) daily traffic counts](https://opendata-nzta.opendata.arcgis.com/datasets/9cb86b342f2d4f228067a7437a7f7313). Also by Waka Kotahi, this data set consists of *daily-updated traffic volumes from state highway count sites, by vehicle type.*

Combining these two datasets is the first step. Further downstream of this data engineering project, I would like to create a daily-updated map similar to [one made by Road Safety Risk](https://roadsafetyrisk.co.nz/maps/heat-maps#Canterbury) (not updated since 2016), and highlight dangerous sections of **Christchurch** specifically by crashes per unit traffic. See [To-do](#to-do) below for more details.

[![image](https://github.com/kanewilliams/christchurch-crash-data/assets/5062932/8bfb5a3c-7c30-49c4-9fad-0701f8e9ab7c)](https://lookerstudio.google.com/reporting/d0fc71e5-f3b3-426c-baff-7eb13c9f22c5)
*Note: Click image to view in Looker Studio*

***

  - [Problem Statement](#problem-statement)
  - [Project Overview](#project-overview)
    - [Prerequisites](#prerequisites)
    - [Instructions](#instructions)
  - [Repository Structure](#repository-structure)
    - [Docker Code](#docker-code)
    - [Terraform Code](#terraform-code)
    - [Mage Code](#mage-code)
    - [dbt Code](#dbt-code)
  - [To-do](#to-do)
  - [Contact](#contact)

## Project Overview

![image](https://github.com/kanewilliams/christchurch-crash-data/assets/5062932/88a01811-ee2c-4804-bc49-823147c0005b)

### Prerequisites
- Install [Docker](https://www.docker.com/products/docker-desktop/).
- Install [Terraform](https://developer.hashicorp.com/terraform/install).
- Create a [Google Cloud](https://cloud.google.com/?hl=en) project.
- Create a [Service Key](https://cloud.google.com/iam/docs/keys-create-delete) `christchurch_service_account.json` for that project, with permissions:
  - `BigQuery Admin`,
  - `Storage Admin`, and
  - `Compute Admin`.
- Move it to `christchurch-crash-data/[SERVICE_KEY]`.
- [Download `TMS_traffic_counts.csv`](https://opendata-nzta.opendata.arcgis.com/datasets/9cb86b342f2d4f228067a7437a7f7313). Move to `christchurch-crash-data/[CSV]`.

### Instructions
#### Provision Cloud Services with Terraform
1) cd `/terraform` and run `terraform init`
2) Open `terraform/variables.tf` and edit:
  - The default bucket name: `traffic-data-your-id` with a unique ID.
  - The project ID with your google cloud project ID.
#### Ingest Data with Mage
3) Run `docker-compose up` on home folder to start Mage.
4) Connect to Mage with `localhost:6789` in browser.
5) Edit `project_id` in each yellow "data exporter" block to your google cloud project ID. There are 4 yellow blocks.
6) Edit `bucket_name` in the `crash_to_gcs` and `traffic_to_gcs` blocks to the unique ID you gave in instruction (2) above.
7) Run the pipeline `crash_traffic_data_to_googlecloud`.

You should now have all the data uploaded to both bigquery and google cloud storage.
#### Process Data with dbt
8) Connect [dbt cloud](https://www.getdbt.com/product/dbt-cloud) with BigQuery. ([Instructions](https://docs.getdbt.com/docs/cloud/connect-data-platform/connect-bigquery))
9) Run the dbt pipeline.

Upon success, you should have a `fact_crashes.sql` in your dbt folder.

#### Destroy Cloud Services
10) Once finished, run `terraform destroy` to remove infrastructure.
***

## Repository Structure

- ### Docker Code
  - `docker-compose.yml`
  - `Dockerfile`

- ### Terraform Code
    TODO

- ### Mage Code
  All pipelines to move the data from the web/locally to GCS are contained in:
    - `/magic-zoomcamp`, and
    - `/mage_data`
 
  ![image](https://github.com/kanewilliams/christchurch-crash-data/assets/5062932/94be8ea9-9749-4c5d-bc7c-497adda90ecd)

- ### DBT Code
  All ELT transformation code is contained in:
  - `/dbt`
  
  ![image](https://github.com/kanewilliams/christchurch-crash-data/assets/5062932/8986c355-b14c-4023-bccf-878521748f74)

## Input Data Description

  - Consists of two .csv files: `TMS_traffic_counts.csv` (406MB) and `Crash_Analysis_System_(CAS)_data.csv` (219MB).

## Output

The **raw data** is uploaded to two locations:
1) *Google Cloud Storage*, Partitioned by Year. This is to save on compute in case we wish to investigate the raw data with SQL queries such as: `Find number of fatal bicycle crashes in 2016`.
2) *Big Query*, for ELT processing with dbt.

The **processed data** is uploaded as `fact_crashes.sql` in Big Query.
-  It is a table with the columns `year`, `has_bicycle`, `fatal`, and `total_traffic_counts`.

## TO-DO:

- [x] Use Terraform for IaC
  - [ ] Automate Terraform installation with Docker 
- [ ] Integrate [Christchurch's Traffic Count Data](https://drive.google.com/drive/folders/1dJXE9XieHTazo1JUo67h8M0rPMYl7gZe). This is a collection of spreadsheets created [by the Christchurch City Council](https://ccc.govt.nz/transport/improving-our-transport-and-roads/traffic-count-data), which contains traffic count data for several key intersections in Christchurch. While NZ crash data has [already](https://roadsafetyrisk.co.nz/maps/heat-maps#Canterbury) been combined and and mapped with traffic data by roadsafetyrisk.co.nz, it does not include local road data (from the council).
  - [ ] Somehow merge this city-wide dataset with the state-wide data.
  - [ ] Filter to just Christchurch
- [ ] Add Testing and CI/CD
- [ ] Automatically pull data, with daily updates.
- [ ] Create a web-interface to browse the data.
  - [ ] Visualize crash risk *per unit traffic*.
- [ ] Use Mage to orchestrate dbt

## Contact

If you have any questions, feedback, or issues with the repository, please feel free to reach out to us using the following channels:

- **Email**: pkanewilliams@gmail.com
- **LinkedIn**: [Kane Williams](https://www.linkedin.com/in/kane-williams01/)

