*** Settings ***
Library         SeleniumLibrary
Library    XML

*** Keywords ***
the User accesses the Home page
    Open Browser  http://localhost:8888  chrome

the User enters new ToDo
    [Arguments]  ${todo_to_enter}
    Input text  class: new-todo  ${todo_to_enter}
    Press Keys  class: new-todo  RETURN

the ToDo count is
    [Arguments]  ${expected_count}
    ${actual_count}=  SeleniumLibrary.Get Element Count  //ul[@class='todo-list']/li
    ${expected_count_number}=  Convert To Number  ${expected_count}
    Should Be Equal  ${expected_count_number}  ${actual_count}

the ToDo field has focus
    Element Should Be Focused  class: new-todo

the ToDo list should be empty
    Page Should Not Contain Element  //section[@class='main']

the ToDo List filter options should not exist
    Page Should Not Contain Element  //section[@class='footer']

the ToDo item is added to the to the list
    [Arguments]  ${expected_todo_text}  ${expected_list_position}
    ${actual_todo_text}=  SeleniumLibrary.Get Element Attribute   (//ul[@class='todo-list']/li//input[@class='edit'])[${expected_list_position}]  value
    Should Be Equal As Strings  ${expected_todo_text}  ${actual_todo_text}

the new ToDo field texbox should be empty
    Element Text Should Be  class: new-todo  ${EMPTY}