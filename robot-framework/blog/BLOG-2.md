# Running Your First Robot Framework Test

## Installing Robot

As mentioned in the previous post, Robot Framework can run on Windows, Mac, or Linux.  You'll need to install both Python and Robot Framework. 

Instead of describing all the install steps here, it's much easier for all if you just checkout the [official instructions from the Robot Framework page](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions).

As mentioned in the install instructions, you can verify you're good to go by running `robot --version`.

Ok, we're getting closer to running some tests!

## IDE support

I'm using Visual Studio code for my Robot Framework examples.  Of course there are other IDEs that will work, and you don't need one at all, so feel free to use what makes sense for you.

If you're using Visual Studio code, I highly recommend 2 Extensions:
 - Robot Framework Language Server
 - Robot Code

[image here]

## My sample repo
I have a repo with all my sample code for my Robot Framework posts.  You can clone it from [here](https://github.com/dwwhalen/cypress-robot-todomvc).

This repo was actually cloned from a Cypress sample app.  I'll be using more of that in my next post, but for now you can just clone the repo and ignore about 99% of it.

Once you have it cloned take a look at the file [robot-framework/e2e/suites/BasicTest.robot](https://github.com/dwwhalen/cypress-robot-todomvc/blob/master/robot-framework/e2e/suites/BasicTest.robot)

If you read the first post, this Robot test should look familiar.  This is the test for our calculator app!

### Breaking into multiple parts
This test is a bit different from what we saw in the first post.  

Robot test suites will usually reference keyword resources in a file separate, and that's what I've done in the sample code.  

Now our test suite just has the tests, with a reference to the my user keywords in a separate resource files  

This makes the test more readable and helps to encourage reuse across tests suites.  Here's our test suite:
``` python
*** Settings ***
Resource        ../resources/calc.resource

*** Test Cases ***
Test some basics of my calculator application
    Log To Console    Starting test
    Verify app calculation    1 + 1    2
    Verify app calculation    14 + 8    22
    Verify app calculation    14 - 8    6
    Verify app calculation    8 - 14    -6
    Verify app calculation    8 * 14    112
    Verify app calculation    14 / 8    1.75
    Verify app calculation    4 + 8 * 2 / 4    8
    Verify app calculation    (4 + 8) * 2 / 4    6
```

And our resource file:
```python
*** Settings ***
Library    ../libraries/MyCalculatorApplication.py

*** Keywords ***
Verify app calculation 
    [Arguments]    ${term}    ${expected}
    Log To Console    Calculating: ${term}
    ${actual}    Do Math    ${term}
    Log To Console    Calculated Result: ${actual}
    Should Be Equal As Numbers    ${actual}    ${expected}
```

### Running the test
If you have everything installed properly and you've cloned the repo, you can run the test from the command line:
```python
robot robot-framework/e2e/suites/BasicTest.robot
```

Hopefully you'll have test results that look like this:

[image here]
### Reporting




