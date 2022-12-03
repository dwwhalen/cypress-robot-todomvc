*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
the User accesses the Home page
    Log  Going to the home page  INFO  False  True
    Open Browser  http://localhost:8888  chrome