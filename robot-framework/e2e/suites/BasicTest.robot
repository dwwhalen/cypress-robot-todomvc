*** Settings ***
Library    ../libraries/MyCalculatorApplication.py

*** Test Cases ***
Test some basics of my calculator application
    Log To Console    Starting test
    Verify app calculation    1 + 1    2
    # Verify app calculation    14 + 8    22
    # Verify app calculation    14 - 8    6
    # Verify app calculation    8 - 14    -6
    # Verify app calculation    8 * 14    112
    # Verify app calculation    14 / 8    1.75
    # Verify app calculation    4 + 8 * 2 / 4    8
    # Verify app calculation    (4 + 8) * 2 / 4    6

*** Keywords ***
Verify app calculation 
    [Arguments]    ${term}    ${expected}
    Log To Console    Calculating: ${term}
    ${actual}    Do Math    ${term}
    Log To Console    Calculated Result: ${actual}
    Should Be Equal As Numbers    ${actual}    ${expected}