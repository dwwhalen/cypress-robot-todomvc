*** Settings ***
Resource        ../resources/calc.resource

*** Test Cases ***
Test some basics of my calculator application
    Log To Console    Starting test
    Verify app calculation    1 + 1    2
    Verify app calculation    14 + 8    22
    Verify app calculation    14 - 8    6
    Verify app calculation    8 - 14    -6
    Verify app calculation    8 * 14    112
    Verify app calculation    14 / 8    1.75
    Verify app calculation    4 + 8 * 2 / 4    8
    Verify app calculation    (4 + 8) * 2 / 4    6