*** Settings ***
Library  Collections
Library  ../../Resources/convert.py

Resource  ../../Resources/query.resource

*** Test Cases ***
Check my record with an Id
    Validate record  65  titel=Happy About Global Software Test Automation  leverbaar=1  prijs=21.5

*** Keywords ***
Validate record
    [Arguments]  ${id}  &{expected result}
    ${result}  Get item by id  ${id}
    ${converted dict}  convert dict values to string  ${result}
    dictionary should contain sub dictionary  ${converted dict}  ${expected result}