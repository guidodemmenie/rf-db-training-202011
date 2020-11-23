*** Settings ***
Library  DatabaseLibrary
Library  Collections

*** Test Cases ***
01_Verbinding maken met db
    connect to database  dbConfigFile=Resources/local.cfg
    ${location_query}  set variable  SELECT * FROM got_battles WHERE location LIKE 'C%'
    ${result}  query  ${location_query}  returnAsDict=${true}
    log dictionary  ${result}[0]
    disconnect from database
