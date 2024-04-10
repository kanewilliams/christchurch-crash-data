import io
import pandas as pd
import requests
from pandas import DataFrame
import os
from mage_ai.io.file import FileIO

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(*args, **kwargs):

    ''' TODO: Include LOCAL Christchurch Data'''
    # '''2016-2024 folders, each containing many spreadsheet files'''
    # urls = ['https://drive.google.com/drive/folders/1Tar9hhRILqqf4REnkiTjpJsAgBZRLrDJ', #2016
    #         'https://drive.google.com/drive/folders/1cC09spRp0QU45C-XQeVtm1SPSitI3YoC', #2017
    #         'https://drive.google.com/drive/folders/1GUitjTTlVh95vxn1E9yOnE8bZYBwz1HE',
    #         'https://drive.google.com/drive/folders/1EqJbP9OVqZNtsw8ALdOkZujqY9pKGPNG',
    #         'https://drive.google.com/drive/folders/1TFUsO5btRl-ef1-9YpHuuo52w4YlsxVx', #2020
    #         'https://drive.google.com/drive/folders/1buttP9Y9r8rTbG9vwOcs0zg6WxKvjp_q',
    #         'https://drive.google.com/drive/folders/1f_6RMXY9m_LVqWmlk9JLBka_iUWGvoal',
    #         'https://drive.google.com/drive/folders/1bNYVMnVtujot6FkPNGH_fvP_KMDmciUs', #2023
    #         'https://drive.google.com/drive/folders/1AlR99mXHSBOsFpCixBd6oBWQQKJw9fn5']

    '''Traffic Management System open data'''

    '''TODO: Automate Downloading of Data'''
    #url = 'https://www.arcgis.com/sharing/rest/content/items/9cb86b342f2d4f228067a7437a7f7313/data'

    '''Ensure TMS_traffic_counts.csv is in root folder'''

    filepath = '/home/src/TMS_traffic_counts.csv'

    return FileIO().load(filepath)


@test
def test_output(output, *args) -> None:

    assert output is not None, 'The output is undefined'
