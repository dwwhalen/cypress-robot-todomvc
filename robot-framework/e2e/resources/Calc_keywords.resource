*** Settings ***
Library         ../libraries/Calculator.py

*** Keywords ***
The Calculator Is Running
    Log  Opening Calculator  INFO  False  True
    Start Calculator

The user calculates "${term}"
    Log To Console  Entering ${term}
    ${result}    Do Math  ${term}
    Set Suite Variable  ${result}
    
The calculation result is "${expected}"
    Log To Console  Checking Result
    Should Be Equal As Numbers  ${result}  ${expected}

