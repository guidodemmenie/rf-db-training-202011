*** Settings ***
Library  DatabaseLibrary
Library  Collections

Suite Setup  Create Connection to database
Suite Teardown  disconnect from database


*** Test Cases ***
Check number of records based on query
    ${rowcount}  row count  SELECT * FROM cursist WHERE voornaam = 'John'
    should be equal as integers  ${rowcount}  1
    row count is equal to x  SELECT * FROM cursist WHERE voornaam = 'John'  1
    ${result}  query  SELECT COUNT(*) AS numberofrows FROM cursist WHERE voornaam = 'John'  returnAsDict=${true}
    log dictionary  ${result}[0]
    should be equal as integers  ${result}[0][numberofrows]  1

Check value against known value
    ${result}  query  SELECT voornaam, training FROM cursist WHERE voornaam = 'John'  returnAsDict=${true}
    log list  ${result}
    log dictionary  ${result}[0]
    Should Be Equal As Strings  ${result}[0][training]  RF DB Testing Workshop
    Should Be Equal As Strings  ${result}[0][voornaam]  John

03_Wait for result to appear in database
    FOR  ${x}  IN RANGE  1  10
        ${numberofrecords}  row count  SELECT * FROM cursist WHERE voornaam = 'John'
        exit for loop if  ${numberofrecords} == 1
        sleep  1s
    END
    run keyword if  ${numberofrecords} != 1  fail  Record not found

04_Wait for result to appear in database
    Wait Until Keyword Succeeds  10s  1s  Check for record
   

*** Keywords ***
Create Connection to database
    connect to database  dbConfigFile=Resources/remote.cfg

Check for record
    row count is equal to x  SELECT * FROM cursist WHERE voornaam = 'John'  1