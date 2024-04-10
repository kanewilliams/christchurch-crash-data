import io
import pandas as pd
import requests
from pandas import DataFrame

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(*args, **kwargs):
    '''Crash data from data.govt.nz
    https://catalogue.data.govt.nz/dataset/crash-analysis-system-cas-data5'''
    
    url = 'https://opendata-nzta.opendata.arcgis.com/api/download/v1/items/8d684f1841fa4dbea6afaefc8a1ba0fc/csv?layers=0'

    return pd.read_csv(url)


@test
def test_output(df) -> None:
    """
    Template code for testing the output of the block.
    """
    assert df is not None, 'Crash data is undefined'