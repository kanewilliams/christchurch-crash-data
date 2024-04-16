#### Provision Cloud Services with Terraform
1) cd `/terraform` and run `terraform init`
2) Open `terraform/variables.tf` and edit:
   - The default bucket name: `traffic-data-your-id` with a unique ID.
   - The project ID with your google cloud project ID.
3) Run `terraform apply`

#### Ingest Data with Mage
4) Run `docker-compose up` on `/christchurch-crash-data` to start Mage.
5) Connect to Mage with `localhost:6789` in browser.
6) Edit `project_id` in each yellow "data exporter" block to your google cloud project ID. There are 4 yellow blocks.
7) Edit `bucket_name` in the `crash_to_gcs` and `traffic_to_gcs` blocks to the bucket ID you choose in (2) above.
8) Run pipeline `crash_traffic_data_to_googlecloud` with `start_crash_pipeline` trigger. ~ 10 min.

#### Process Data with dbt
8) Connect [dbt cloud](https://www.getdbt.com/product/dbt-cloud) with BigQuery. ([Instructions](https://docs.getdbt.com/docs/cloud/connect-data-platform/connect-bigquery))
9) Change development credentials so target schema is `dbt_traffic_data`. ([Instructions](https://docs.getdbt.com/docs/build/custom-target-names))
10) Change `YOUR_PROJECT_NAME` in `/dbt/models/staging/sources.yml` to your google cloud project ID.
11) Run `dbt build` in dbt. Upon success, you should have `fact_crashes.sql` in your `dbt_traffic_data` bigquery dataset.

#### Destroy Cloud Services
12) Once finished with the project, run `terraform destroy` to decomission your cloud infrastructure, saving cost.