*** Settings ***
Library         Calculator.py

*** Keywords ***
The Calculator Is Running
    Log  Opening Calculator  INFO  False  True
    Start Calculator

The User Enters The Term "${term}"
    Log To Console  Entering ${term}
    set global variable  ${term}

The User Triggers The Calculation
    Log To Console  Triggering Calculation
    ${result}    Calculate Term    ${term}
    Set Suite Variable  ${result}
    
The Result Should Be "${expected}"
    Log To Console  Checking Result
    Should Be Equal As Numbers  ${result}  ${expected}