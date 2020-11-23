*** Settings ***
Library  DatabaseLibrary

*** Test Cases ***
01_Verbinding maken met db
    connect to database  dbapiModuleName=${dbapiModuleName}  dbName=${dbName}
    ...  dbUsername=${dbUsername}  dbPassword=${dbPassword}
    ...  dbHost=${dbHost}  dbPort=${dbPort}
    disconnect from database