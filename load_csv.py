import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv('path/data/Fire_Incidents_20241030.csv')

df = df[['neighborhood_district',
    'Alarm DtTm',
    'Arrival DtTm',
    'Battalion']]

df.to_csv('path/seeds/Fire_Incidents_20241030_t.csv',index=True)

engine = create_engine('postgresql://user:password@localhost:5432/postgres')

df.to_sql(
    name="fi_raw_data", 
    con=engine, 
    if_exists="replace", 
    index=True, 
    schema='case_study'
)




