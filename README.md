# Christchurch Crash and Traffic Data
This is my capstone project of the 2024 Data Engineering Zoomcamp, consisting of New Zealand Crash Data joined with New Zealand Traffic Data, filtered to just Christchurch. 

Tools used: **Docker, Terraform, Mage, dbt, Looker, Google Cloud Platform (BigQuery and GCS)**
  - [Problem Statement](#problem-statement)
  - [Project Overview](#project-overview)
    - [Instructions](#instructions)
    - [Visualisation](#visualisation)
  - [Repository Structure](#repository-structure)
    - TODO
    - TODO
    - TODO
    - TODO
  - [To-do](#to-do)
  - [Contact](#contact)

***
## Problem Statement
For my data engineering course project, I wanted to combine two data sets:

 1) [NZ Crash Data from the Crash Analysis System (CAS)](https://catalogue.data.govt.nz/dataset/crash-analysis-system-cas-data5). The dataset contains information from New Zealand's crashes from 1-January-2000, and is updated monthly. It is curated by Waka Kotahi - the NZ Transport Agency. 

 2) [TMS (Traffic Management System) daily traffic counts](https://opendata-nzta.opendata.arcgis.com/datasets/9cb86b342f2d4f228067a7437a7f7313). Also by Waka Kotahi, this data set consists of *daily-updated traffic volumes from state highway count sites, by vehicle type.*

Further downstream of this data engineering project, I would like to create a daily-updated map similar to [one made by Road Safety Risk](https://roadsafetyrisk.co.nz/maps/heat-maps#Canterbury) (no longer updated), and highlight dangerous sections of Christchurch by crashes per unit traffic. It will be fun to compare my results to the one made above.

***

## Project Overview

 - (insert image)

### Instructions

  - TODO

### Visualisation  
***

## Repository Structure

- ### Docker Code
    TODO

- ### Terraform (Infrastructure as) Code
    TODO

- ### Mage Code
    TODO
  
- ### DBT Code
    TODO

## Initial Dataset Description

  - Consists of two .csv files: `TMS_traffic_counts.csv` (~400MB) and `Crash_Analysis_System_(CAS)_data.csv` (219MB).

## Final Dataset Description

-  Is a table in google cloud storage and a dataset in big query.

## TO-DO:

- [ ] [Christchurch's Traffic Count Data](https://drive.google.com/drive/folders/1dJXE9XieHTazo1JUo67h8M0rPMYl7gZe). This is a collection of spreadsheets created [by the Christchurch City Council](https://ccc.govt.nz/transport/improving-our-transport-and-roads/traffic-count-data), which contains traffic count data for several key intersections in Christchurch. While NZ crash data has [already been combined and and mapped with traffic data by roadsafetyrisk.co.nz](https://roadsafetyrisk.co.nz/maps/heat-maps#Canterbury), it does not include local road data (from the council).
  - [ ] Somehow merge this new dataset with the old one. 
- [ ] Add Testing and CI/CD
- [ ] Use Terraform for IaC
- [ ] Automatically pull data, with daily updates.
- [ ] Create a web-interface to browse, with a heatmap.

## Contact

If you have any questions, feedback, or issues with the repository, please feel free to reach out to us using the following channels:

- **Email**: pkanewilliams@gmail.com
- **LinkedIn**: [Kane Williams](https://www.linkedin.com/in/kane-williams01/)

