wel it's time to wrap up my series of posts on the [Robot Framework](http://robotframework.org/).  If you haven't checked out the [other posts in the series](https://dev.to/dwwhalen/series/21110), please do.  

This post builds on what I've discussed previously.


# Robot Framework and Gherkin
In the last post we built a Robot test to validate some functionality of the ToDo app.  The repo can be found [here](https://github.com/dwwhalen/cypress-robot-todomvc).

This is what our current Robot scenario looks like:

```
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
```

There are at least a couple issues with this test:
- Page locators are not reusable.  Following this pattern, if I wanted to create another test (or 100 tests) that needs the count of ToDo items, I would probably just copy/paste that locator, `//ul[@class='todo-list']/li` every time I needed it.  A better strategy would be to define the locator in a single place.  If the locator ever needs to change, I have one place to go to make my update.

- To my eyes, the test is hard to read.  This is a pretty basic test, but It's not super clear what's going on.  Also, this pattern requires knowledge of the Robot syntax.  Product owners and BAs are not going to be interested in reading this, and probably no one else will be either.

Let's address these 2 issues.

As a reminder, this is what that test is actually doing:

```
- open the ToDo page
- verify there are no ToDos
- add a ToDo
- verify the ToDo text matches what was added
- verify there is 1 ToDo
```

I want my test to look a lot like this, without all the implementation details in my way. 

## Gherkin and Robot Framework
In the real world, the above is a good example of an acceptance test.  It defines some basic functionality and describes how the application should react.  Automating the testing of the requirements is useful as a component of [Acceptance Test Driven Development (ATDD)](https://en.wikipedia.org/wiki/Acceptance_test-driven_development).  I usually see this go hand-in-hand with [BDD](https://cucumber.io/docs/bdd/) and the gherkin syntax. In that example our gherkin-syntax test could look something like this:

```gherkin
When the User accesses the Home page
Then the ToDo count is  0
When the user enters new ToDo  learn Robot
Then the ToDo item is added to the to the list  learn Robot  1
And the ToDo count is  1
```
So how does Robot Framework all =ow us to write tests like this?

First of all, remember Robot is a keyword driven framework.  The first line of our test is `When the User accesses the Home page`.  As discussed in [previous posts](https://dev.to/dwwhalen/series/21110), we can easily hide the implementation details of this step in a Robot resource file.  This step in a resource file could be something as simple as:
```python
*** Keywords ***
the User accesses the Home page
    Open Browser  http://localhost:8888  chrome
```
Here I have created a custom keyword `the User accesses the Home page`, which uses the built-in keyword `Open Browser`.  Note that my custom keyword does NOT begin with the word `When`.  That's because when matching keywords during test execution, Robot will ignore the prefixes Given, When, Then, And if no match is found for the full keyword.  This allows Robot to easily integrate with building tests using the Gherkin syntax.

And since we can pass parameters with Robot keywords, we're doing that with the step `When the user enters new ToDo  learn Robot`.  The implementation of that step in the resource file can look something like this:

```python
*** Keywords ***
the User enters new ToDo
[Arguments]  ${todo_to_enter}
Input text  class: new-todo  ${todo_to_enter}
Press Keys  class: new-todo  RETURN
```

The test can be found in the here in my test repo.  

To run these tests, just be sure to first start the app locally.  If you can't open  it through the browser manually, the Robot test won't be able to either.

# Wrap-up
So that's it. I hope this series of posts has helped someone learn more about Robot Framework.  Of course I have barely scratched the surface, and the links below should help you continue your Robot journey!

## Links
https://github.com/robotframework/QuickStartGuide/blob/master/QuickStart.rst
https://github.com/robotframework/RobotDemo
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
https://robotframework.org/robotframework/latest/libraries/BuiltIn.html