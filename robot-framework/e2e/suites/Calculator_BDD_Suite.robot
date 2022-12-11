*** Settings ***
Resource        ../resources/Calc_keywords.resource

*** Test Cases ***
Test Calculator With BDD Syntax
    Given The Calculator Is Running
    When The user calculates "1 + 1"
    Then The calculation result is "2"