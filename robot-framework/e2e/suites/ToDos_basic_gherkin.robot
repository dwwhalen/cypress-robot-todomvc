*** Settings ***
Library    SeleniumLibrary
Resource        ../resources/ToDos_keywords.resource
# Test Setup  Given the User accesses the Home page

*** Variables ***
${URL}      http://localhost:8888
${BROWSER}      Chrome

***Test Case***
Add a new ToDo item
    When the User accesses the Home page
    Then the ToDo count is  0
    When the user enters new ToDo  learn Robot
    Then the ToDo count is  1
    Then the ToDo item is added to the to the list  learn Robot  1
    # Sleep  10