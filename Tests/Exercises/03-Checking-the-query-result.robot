*** Settings ***
Library  DatabaseLibrary
Library  Collections

Suite Setup  Create Connection to database
Suite Teardown  disconnect from database

*** Test Cases ***
Validate number of records in table variant 1 
    ${result}  query  SELECT COUNT(*) AS numberofrecords FROM zoekresultaat  returnAsDict=${true}
    should be equal as integers  ${result}[0][numberofrecords]  24

Validate number of records in table variant 2
    ${rowcount}  row count  SELECT id FROM zoekresultaat
    should be equal as integers  ${rowcount}  24

Validate number of records in table variant 3 
    row count is equal to x  SELECT id FROM zoekresultaat  24

Validate one title with python in the name
    row count is equal to x  SELECT id FROM zoekresultaat WHERE Titel LIKE '%Python%'  1

Validate cost of the complete guide
    ${result}  query  SELECT titel, prijs FROM zoekresultaat WHERE titel = 'Complete Guide to Test Automation'  returnAsDict=${true}
    log list  ${result}
    log dictionary  ${result}[0]
    should be equal as strings  ${result}[0][prijs]  33.65

*** Keywords ***
Create Connection to database
    connect to database  dbConfigFile=Resources/remote.cfg