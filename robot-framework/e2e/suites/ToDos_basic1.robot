*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://localhost:8888
${BROWSER}      Chrome

***Test Case***
Add a new ToDo item
  Open Browser    ${URL}  ${BROWSER}
  Page Should Not Contain Element  //section[@class='main']
  Input text  class: new-todo  Finish This Blog Post
  Press Keys  class: new-todo  RETURN
  Page Should Contain Element  //section[@class='main']
  ${actual_count}=  SeleniumLibrary.Get Element Count  //ul[@class='todo-list']/li
  ${expected_count_number}=  Convert To Number  1
  Should Be Equal  ${expected_count_number}  ${actual_count}
  Sleep  10