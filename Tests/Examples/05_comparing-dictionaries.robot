*** Settings ***
Library  Collections

*** Test Cases ***
Dictionaries vergelijken
    &{dict1}  create dictionary  voornaam=Guido  achternaam=Demmenie  training=RF DB-testing
    &{dict2}  create dictionary  voornaam=Guido  achternaam=Demmenie

    #Dictionaries Should Be Equal  ${dict1}  ${dict2}
    Dictionary Should Contain Sub Dictionary  ${dict1}  ${dict2}