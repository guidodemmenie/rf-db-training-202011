*** Settings ***
Library  Collections

*** Test Cases ***
Provide arguments as usual
    Query keyword  Guido  Demmenie

Provide named arguments
    Query keyword  lastname=Demmenie  firstname=Guido 

Provide dictionary
    Query keyword - dictionary  lastname=Demmenie  firstname=Guido  age=37

Provide scalar and dictionary
    Query keyword - scalar and dictionary  firstname=Guido  lastname=Demmenie  age=37

*** Keywords ***
Query keyword
    [Arguments]  ${firstname}  ${lastname}
    log to console  Firstname: ${firstname}
    log to console  Lastname: ${lastname}

Query keyword - dictionary
    [Arguments]  &{dict}
    log dictionary  ${dict}

Query keyword - scalar and dictionary
    [Arguments]  ${firstname}  &{dict}
    log  ${firstname}
    log dictionary  ${dict}
