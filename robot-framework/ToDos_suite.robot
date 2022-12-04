*** Settings ***
Resource        ToDos_keywords.resource
Test Setup  Given the User accesses the Home page

*** Test Cases ***
Add a couple ToDos and verify the count is correct
    When the user enters new ToDo  learn testing
    And the user enters new ToDo  be cool
    Then the ToDo count is  2