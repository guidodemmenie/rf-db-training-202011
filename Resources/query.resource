*** Settings ***
Library  DatabaseLibrary

*** Keywords ***
Get item by id
    [Arguments]  ${id}
    Create Connection to database
    ${result}  query  SELECT * FROM zoekresultaat WHERE id = ${id}  returnAsDict=${true}
    disconnect from database
    [Return]  ${result}[0]

Create Connection to database
    connect to database  dbConfigFile=Resources/remote.cfg