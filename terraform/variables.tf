variable "credentials" {
  description = "My Credentials"
  default     = "../crash_service_account.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}

variable "project" {
  description = "Project"
  # UPDATE to your Google Cloud Storage PROJECT ID below.
  default     = "kaneterratest2"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  #UPDATE to a unique bucket name below.
  default     = "traffic-data-your-id"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "raw_traffic_data"
}

variable "bq_dbt_dataset_name" {
  description = "My dbt BigQuery Dataset Name"
  default     = "dbt_traffic_data"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}