*** Settings ***
Library    ../libraries/MyCalculatorApplication.py

*** Keywords ***
Verify app calculation 
    [Arguments]    ${term}    ${expected}
    Log To Console    Calculating: ${term}
    ${actual}    Do Math    ${term}
    Log To Console    Calculated Result: ${actual}
    Should Be Equal As Numbers    ${actual}    ${expected}