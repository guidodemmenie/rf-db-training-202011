*** Settings ***
Library  DatabaseLibrary
Library  Collections
Library  ../../Resources/convert.py


Suite Setup  Create Connection to database
Suite Teardown  disconnect from database

*** Test Cases ***
Test battle from database
    Validate battle  battle_number=1  name=Battle of the Golden Tooth  attacker_1=Lannister  defender_1=Tully  year=298

*** Keywords ***
Validate battle
    [Arguments]  ${battle_number}  &{expected result}
    ${result}  Fetch battle  ${battle_number}
    # option 1 (fails)
    # dictionary should contain sub dictionary  ${result}  ${expected result}
    # option 2
    FOR  ${key}  IN  @{expected result.keys()}
        ${value}  get from dictionary  ${expected result}  ${key}
        should be equal as strings  ${value}  ${result}[${key}]
    END
    # option 3
    FOR  ${key}  ${value}  IN  &{result}
        should be equal as strings  ${value}  ${result}[${key}]
    END
    # option 4
    ${converted dict}  convert dict values to string  ${result}
    dictionary should contain sub dictionary  ${converted dict}  ${expected result}

Fetch battle
    [Arguments]  ${battle_number}
    ${battle_query}  set variable  SELECT * FROM got_battles WHERE battle_number = ${battle_number}
    ${battle}  query  ${battle_query}  returnAsDict=${true}
    [Return]  ${battle}[0]

Create Connection to database
    connect to database  dbConfigFile=${EXECDIR}/Resources/local.cfg