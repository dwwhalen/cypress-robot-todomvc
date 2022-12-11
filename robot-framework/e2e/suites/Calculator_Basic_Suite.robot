*** Settings ***
Library         ../libraries/MyCalculatorApplication.py

*** Test Cases ***
Some basic tests of my calculator application
    Start the calculator
    Verify calculation "14 + 8" "22"
    Verify calculation "14 - 8" "6"
    Verify calculation "8 - 14" "-6"
    Verify calculation "8 * 14" "112"
    Verify calculation "14 / 8" "1.75"
    Verify calculation "14 + 8" "8 + 14"
    Verify calculation "8 * 14" "14 * 1 * 8 * 1"
    Verify calculation "4 + 8 * 2 / 4" "8"

*** Keywords ***
Start the calculator
    Log  Opening Calculator  INFO  False  True
    Start Calculator

Verify calculation "${term}" "${expected}"
    Log To Console  Calculating: ${term}
    ${actual}  Do Math  ${term}
    Log To Console  Calculation Result: ${actual}
    ${expected_result}  Do Math  ${expected}
    Should Be Equal As Numbers  ${actual}  ${expected_result}