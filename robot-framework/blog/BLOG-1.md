# Test Automation With Robot Framework

As a test automation engineer, I've had an awareness of [Robot Framework](http://robotframework.org/) for some time, but I have never explored it's capabilities.  Until now.  

I recently decided to spend a little time familiarizing myself with Robot Framework's capabilities, and that's what I want to cover in this series of posts.

I'll just be scratching the surface here, but I will hopefully provide enough detail to get you started.

## So what is it?
Robot Framework is an open source test automation framework that uses a keyword-driven testing approach to drive the tests.  It is implemented using Python, and is OS independent.  

My focus with these posts will be automating browser-based tests, but Robot Framework is not limited to browser-based tests.   

In addition to test automation, Robot Framework can be used for [robotic process automation (RPA)](https://robotframework.org/rpa/).

## Extensibility
Robot Framework can leverage existing test libraries to make the test automation engineer's life much easier.  For example, the SeleniumLibrary library can be user to automate browser interaction, and I'll talk more about that very soon.  

There are also popular extensions to simplify mobile testing, API testing, data-driven testing, and database interactions.  There is even an extension to build automated tests for IBM mainframes!

## Keyword driven
One of the advantages of Robot Framework is that it uses human readable keywords in the test syntax.  Of course, the determined test engineer can still make tests that are completely UN-readable, but Robot Framework provides the tools to help avoid that.  Easy-to-read tests are critical when sharing with business stakeholders or folks that would prefer to not read code.

So enough talk, let's look at an example!

## Sample test
Just to give you a look at a Robot test, I'm going to start super simple.  The "app" I'm going to test is a contrived example of a calculator.  It's implemented in Python, and is in a text file named `MyCalculatorApplication.py`:
```python
def do_math(term):
    """
    Interpret input term as a mathematical expression
    and return the result
    """
    return eval(term)
```

See I told you it was easy!  The `do_math(term)` function will accept a mathematical expression and return a result. So that's our app.  

How do we want to test this app?  I'm sure plenty of things come to mind.  Since this is a calculator, the first thing I want to do is verify the app returns "2" when I ask it what "1 + 1" is.  Let's see what that test might look like in Python.

## What’s a robot test suite?
My Robot Framework test is going to be in a single text file, named `BasicTest.robot`.  This file is referred to as a "test suite" and can be composed of a number of sections.  My first test is going to have 3 sections:

### *** Settings *** section
The first section of my test file is the Settings section.  The Settings section is used to reference external files needed for the test.  For my test it will reference my external app, which is just the Calculator python function described above.  So the Settings section looks like this:
```python
*** Settings ***
Library    ../libraries/MyCalculatorApplication.py
```

Pretty self-explanatory.  We are just giving a relative reference to the python file that is my app.

One thing to mention here.  If you work with Robot Framework for very long, you'll quickly learn that spacing and positioning are very important.  The `*** Settings ***` header needs to be left-justified, `Library` needs to be left-justified, and there must be 2 or more spaces after `Library` (or a tab). 

### *** Test Cases *** section
The Test Cases section describes the test case.  In this example we have one test case, named `Test some basics of my calculator application`.
```python
*** Test Cases ***
Test some basics of my calculator application
    Log To Console    Starting test
    Verify app calculation    1 + 1    2
```
Hopefully it's clear what's going on with these 2 lines.  We are logging a message to the console when the test starts, and then verifying that the app returns "2" when we ask it what "1 + 1" is.  

Let's take a closer look at the keywords in these 2 lines. 

`Log to Console` is a Robot [builtin keyword](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html).  The keyword is all I need to log a message to the console.

`Verify app calculation` is NOT a builtin keyword.  This is a custom keyword I have created specifically for my test, and the implementation details can be found in the Keywords section.

### *** Keywords *** section
The Keywords section gives us the capability to create custom keywords by combining existing keywords.  These can be considered user-defined keywords, as the automation developer has complete control.

Take a look at my `Verify app calculation` keyword and see if it makes sense:
```python
*** Keywords ***
Verify app calculation 
    [Arguments]    ${term}    ${expected}
    Log To Console    Calculating: ${term}
    ${actual}    Do Math    ${term}
    Log To Console    Calculated Result: ${actual}
    Should Be Equal As Numbers    ${actual}    ${expected}
```

The **1st line** is the name of the keyword (`Verify app calculation`), and it must be left justified.

The **2nd line** identifies the arguments/parameters for the keyword.  In our example that's the mathematical term and the expected result of the calculation.

The **3rd line** is just using the `Log to Console` builtin keyword to log some info to the console.  Your custom keywords can and should leverage builtin keywords where appropriate.

The **4th line** might seem a little tricky.  Remember our Calculator application has one method, named `do_math`.  This 4th line is calling `do_math` and passing the mathematical term.  `do_math` will return the  result of the calculation.  We are setting the `${actual}` variable to the value returned from `do_math`.

The **5th line** is more logging.

The **6th line**, ok almost there!  Remember, this `Verify app calculation` keyword is being used to verify that the actual result returned from the calculator matches our expected result.  To do this we're using another builtin keyword (`Should Be Equal As Numbers`) to assert that the actual result matches the expected result.

I should also point out, the keywords are usually stored in a separate `keywords` file, and not in the same file as the test suite.  This allows them to be easily referenced by other Robot test suites.  

And that's it.  Our complete test file `BasicTest.robot` looks like this:

```python
*** Settings ***
Library    ../libraries/MyCalculatorApplication.py

*** Test Cases ***
Test some basics of my calculator application
    Log To Console    Starting test
    Verify app calculation    1 + 1    2

*** Keywords ***
Verify app calculation 
    [Arguments]    ${term}    ${expected}
    Log To Console    Calculating: ${term}
    ${actual}    Do Math    ${term}
    Log To Console    Calculated Result: ${actual}
    Should Be Equal As Numbers    ${actual}    ${expected}
```
## Running the test
To actually run this test you'll need to have Python and Robot installed.  I will cover that in more detail in my next post.

Until then, just know that once we have everything installed, it's simply a matter of running from the command line:
```
robot BasicTest.robot
```

And this is what is looks like in the console when we run the test:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/y2n1xnbnnyxfv688pr27.png)
 
<br/><br/><br/><br/>

## Wrap up
Check out the next post to get this test running on your own machine, and much more!