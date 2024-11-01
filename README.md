# Case-Study-DBT
Case study using DBT to get dimensions for reporting

This repository has the DBT sql models to map from a postgres database table with raw data to three dimensions tables in postgres database according a .csv source file

The database is created in a docker container locally using a downloaded postgres image in docker.

A python script (load_csv.py) is used, to map the .csv raw data into a table (case_study.fi_raw_data) in postgres as a source for the DBT models.

The models for time period are:
- transformed_data_period.sql (here required data transformations are made)
- time_period.sql (the dimension is created in postgres)
The models for district are:
- transformed_data_district.sql (here required data transformations are made)
- district.sql (the dimension is created in postgres)
The models for battalion are:
- transformed_data_battalion.sql (here required data transformations are made)
- battalion.sql (the dimension is created in postgres)
