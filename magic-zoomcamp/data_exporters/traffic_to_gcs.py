import pyarrow as pa
import pyarrow.parquet as pq
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = '/home/src/crash_service_account.json'
bucket_name = 'traffic-data-christchurch'
project_id = 'christchurch-crash-data'

table_name = "traffic_data"

root_path = f'{bucket_name}/{table_name}'


@data_exporter
def export_data(data, *args, **kwargs):
    '''Partitions the crash data based on year
       Uploads as Parquet'''
    table = pa.Table.from_pandas(data)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path,
        partition_cols=['Date'],
        filesystem=gcs
    )

    print("COMPLETE!")
