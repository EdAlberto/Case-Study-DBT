# Case-Study-DBT
Case study using DBT to get dimensions for reporting (attached is the image: report.png which is a report using the dimensions)

This repository has the DBT sql models to map from a postgres database table with raw data to three dimensions tables in postgres database according a .csv source file

The database is created in a docker container locally using a downloaded postgres image in docker.

A python script (load_csv.py) is used, to map the .csv raw data into a table (case_study.fi_raw_data) in postgres with selected columns (index, neighborhood_district,Alarm DtTm,Arrival DtTm and Battalion) as a source for the DBT models.

The models for time period are:
- transformed_data_period.sql (here required data transformations are made, getting the time period in minutes)
- time_period.sql (the dimension is created in postgres)
The models for district are:
- transformed_data_district.sql (here required data transformations are made)
- district.sql (the dimension is created in postgres)
The models for battalion are:
- transformed_data_battalion.sql (here required data transformations are made)
- battalion.sql (the dimension is created in postgres)

this is the output from dbt run command:

03:17:35  Running with dbt=1.9.0-b3
03:17:36  Registered adapter: postgres=1.8.2
03:17:36  Found 1 seed, 6 models, 544 macros
03:17:36
03:17:36  Concurrency: 1 threads (target='dev')
03:17:36
03:17:36  1 of 6 START sql table model case_study.transformed_data_battalion ............. [RUN]
03:17:37  1 of 6 OK created sql table model case_study.transformed_data_battalion ........ [SELECT 681856 in 0.48s]
03:17:37  2 of 6 START sql table model case_study.transformed_data_district .............. [RUN]
03:17:37  2 of 6 OK created sql table model case_study.transformed_data_district ......... [SELECT 681856 in 0.39s]
03:17:37  3 of 6 START sql table model case_study.transformed_data_period ................ [RUN]
03:17:38  3 of 6 OK created sql table model case_study.transformed_data_period ........... [SELECT 681856 in 1.05s]
03:17:38  4 of 6 START sql table model case_study.battalion .............................. [RUN]
03:17:38  4 of 6 OK created sql table model case_study.battalion ......................... [SELECT 681856 in 0.32s]
03:17:38  5 of 6 START sql table model case_study.district ............................... [RUN]
03:17:39  5 of 6 OK created sql table model case_study.district .......................... [SELECT 681856 in 0.35s]
03:17:39  6 of 6 START sql table model case_study.time_period ............................ [RUN]
03:17:39  6 of 6 OK created sql table model case_study.time_period ....................... [SELECT 681856 in 0.39s]
03:17:39  
03:17:39  Finished running 6 table models in 0 hours 0 minutes and 3.21 seconds (3.21s).
03:17:39  
03:17:39  Completed successfully
03:17:39
03:17:39  Done. PASS=6 WARN=0 ERROR=0 SKIP=0 TOTAL=6

