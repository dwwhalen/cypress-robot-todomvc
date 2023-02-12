*** Settings ***
Resource        ../resources/ToDos_keywords.resource
Test Setup  Given the User accesses the Home page

*** Variables ***
#   let TODO_ITEM_ONE = 'buy some cheese'
#   let TODO_ITEM_TWO = 'feed the cat'
#   let TODO_ITEM_THREE = 'book a doctors appointment'

${TODO_ITEM_ONE}=  buy some cheese
${TODO_ITEM_TWO}=  feed the cat
${TODO_ITEM_THREE}=  book a doctors appointment

*** Test Cases ***
Add a couple ToDos and verify the count is correct
    # cy.get('.new-todo')
    # .type('learn testing{enter}')
    # .type('be cool{enter}')
    # cy.get('.todo-list li').should('have.length', 2)
    When the user enters new ToDo  learn testing
    And the user enters new ToDo  be cool
    Then the ToDo count is  2

On initial load ToDo input field should have focus
    # cy.focused().should('have.class', 'new-todo')
    Then the ToDo field has focus

On initial load should hide #main and #footer
    # cy.get('.todo-list li').should('not.exist')
    # cy.get('.main').should('not.exist')
    # cy.get('.footer').should('not.exist')
    Then the ToDo count is  0
    And the ToDo list should be empty
    And the ToDo List filter options should not exist
    
Make sure that new ToDos are correctly added to the list
    When the user enters new ToDo  ${TODO_ITEM_ONE}
    Then the ToDo item is added to the to the list  ${TODO_ITEM_ONE}  1
    And the user enters new ToDo  ${TODO_ITEM_TWO}
    Then the ToDo item is added to the to the list  ${TODO_ITEM_TWO}  2

Create several todos then check the number of items in the list
    When the user enters new ToDo  Item One
    When the user enters new ToDo  Item Two
    When the user enters new ToDo  Item Three
    When the user enters new ToDo  Item Four
    Then the ToDo count is  4

Verify text input field is cleared wwhen an item is added
    #   cy.get('.new-todo')
    #   .type(TODO_ITEM_ONE)
    #   .type('{enter}')
    #   cy.get('.new-todo').should('have.text', '')
    When the user enters new ToDo  Some New Item
    Then the new ToDo field texbox should be empty