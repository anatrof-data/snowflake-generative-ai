USE WAREHOUSE compute_wh;
CREATE DATABASE test_ingestion;
CREATE OR REPLACE FILE FORMAT test_ingestion.public.csv_ff
type = 'csv';

-- Then use a CREATE STAGE command to create a stage named “test_stage” in the “public” schema in the “test_ingestion” database.
-- The url to use is: 's3://sfquickstarts/tasty-bytes-builder-education/raw_pos/truck'
-- And the file format to use is csv_ff.

CREATE OR REPLACE STAGE test_ingestion.public.test_stage
url = 's3://sfquickstarts/tasty-bytes-builder-education/raw_pos/truck'
file_format = test_ingestion.public.csv_ff;

-- Run a list command (“ls”) to view the staged files. What number do you see in the size column for “truck.csv.gz”?
ls @test_ingestion.public.test_stage;

-- truck table build
CREATE OR REPLACE TABLE test_ingestion.public.truck
(
    truck_id NUMBER(38,0),
    menu_type_id NUMBER(38,0),
    primary_city VARCHAR(16777216),
    region VARCHAR(16777216),
    iso_region VARCHAR(16777216),
    country VARCHAR(16777216),
    iso_country_code VARCHAR(16777216),
    franchise_flag NUMBER(38,0),
    year NUMBER(38,0),
    make VARCHAR(16777216),
    model VARCHAR(16777216),
    ev_flag NUMBER(38,0),
    franchise_id NUMBER(38,0),
    truck_opening_date DATE
);

-- Use the COPY INTO command to copy into the test_ingestion.public.truck table from the test_ingestion.public.test_stage stage.
COPY INTO test_ingestion.public.truck
FROM @test_ingestion.public.test_stage
