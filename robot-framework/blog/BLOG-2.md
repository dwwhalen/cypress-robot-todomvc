# Running Your First Robot Framework Test

In my [first Robot Framework post](https://dev.to/leading-edje/test-automation-with-robot-framework-2idc) I gave a brief overview of Robot Framework and described a sample test.  Now it's time for you to get the tests running!


## Installing Robot

As mentioned in the [previous post](https://dev.to/leading-edje/test-automation-with-robot-framework-2idc), Robot Framework can run on Windows, Mac, or Linux.  You'll need to install both Python and Robot Framework. 

Instead of describing all the install steps here, it's much easier for all if you just checkout the [official instructions from the Robot Framework page](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions).

As mentioned in the [install instructions](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions), you can verify you're good to go by running `robot --version`.

Ok, we're getting closer to running some tests!

## IDE support

I'm using Visual Studio code for my Robot Framework examples.  Of course there are other IDEs that will work, and you don't need one at all, so feel free to use what makes sense for you.

If you're using Visual Studio code, I highly recommend 2 Extensions:
 - Robot Framework Language Server
 - Robot Code

![VS Code extensions](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/hwfywzm4au89asjqikq9.png)

## My sample repo
I have a repo with sample code that I will reference.  You can clone it from [here](https://github.com/dwwhalen/cypress-robot-todomvc).

This repo was actually forked from a Cypress sample app.  I'll be using more of that in my next post, but for now you can just clone the repo and ignore about 99% of it.

Once you have it cloned, take a look at the file [robot-framework/e2e/suites/BasicTest.robot](https://github.com/dwwhalen/cypress-robot-todomvc/blob/master/robot-framework/e2e/suites/BasicTest.robot).

If you read the [first post](https://dev.to/leading-edje/test-automation-with-robot-framework-2idc), this Robot test should look familiar.  This is the test for our calculator app!

### Breaking the test into multiple files
This test is a bit different from what we saw in the first post.  Robot test suites will usually reference keyword resources in a separate file, and that's what I've done in the sample code.  

Now our test suite just has the tests, with a reference to the user keywords in a separate resource file.

This makes the test more readable and helps to encourage keyword reuse across tests suites.  So here's our test suite (with some more calculation tests added):
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

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/aips0cig4ulfm7eso9l2.png)

### Reporting
In addition to the test results in the console, Robot Framework has also created an html report for the test run.  After you run the test you should see the file `report.html` in the root directory.

If you drill into the basic test you'll see some details like this:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/40oul1jq9yqz5tfnegsz.png)

Of course the reporting is usually more important when we have failures.  Go ahead a break the test yourself and see how Robot Framework deals with that.

### What's next?
Hopefully you were able to get the test running locally.  That will allow you to start experimenting, which is when things start getting real.  

In the next post we will bid a fond farewell to our simple calculator app, and create Robot Framework tests for an actual website.  

Thanks for reading!
