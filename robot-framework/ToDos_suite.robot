*** Settings ***
Resource        ToDos_keywords.resource

*** Test Cases ***
Access the Home page
    Given the User accesses the Home page
    # When The User Enters The Term "1 + 1"
    # And The User Triggers The Calculation
    # Then The Result Should Be "2"