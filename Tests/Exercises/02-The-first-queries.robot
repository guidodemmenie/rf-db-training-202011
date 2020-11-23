*** Settings ***
Library  DatabaseLibrary
Library  Collections

Suite Setup  Create Connection to database
Suite Teardown  disconnect from database

*** Test Cases ***
01_Create a new student
    ${query_new_student}  set variable  INSERT INTO cursist (voornaam, achternaam, emailadres, training) VALUES ('John', 'Doe', 'idontwantspam@myaddress.com', 'RF DB Testing Workshop')
    execute sql string  ${query_new_student}

02_Validate new student
    ${select_new_student}  set variable  SELECT * FROM cursist WHERE voornaam = 'John'
    Row Count Is Equal To X  ${select_new_student}  1
    ${result}  query  ${select_new_student}  returnAsDict=${true}
    log list  ${result}

03_Delete student
    ${query_delete}  set variable  DELETE FROM cursist WHERE voornaam = 'John'
    execute sql string  ${query_delete}

*** Keywords ***
Create Connection to database
    connect to database  dbConfigFile=${EXECDIR}/Resources/remote.cfg