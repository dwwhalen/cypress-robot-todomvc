*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
the User accesses the Home page
    Open Browser  http://localhost:8888  chrome

the User enters new ToDo
    [Arguments]  ${todo_to_enter}
    Input text  class: new-todo  ${todo_to_enter}
    Press Keys  class: new-todo  RETURN

the ToDo count is
    [Arguments]  ${expected_count}
    ${actual_count}=  Get Element Count  //ul[@class='todo-list']/li
    ${expected_count_number}=  Convert To Number  ${expected_count}
    Should Be Equal  ${expected_count_number}  ${actual_count}