import io
import pandas as pd
from pandas import DataFrame

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    
    data['Date'] = pd.to_datetime(data['startDate']).dt.year
    return data


@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'
