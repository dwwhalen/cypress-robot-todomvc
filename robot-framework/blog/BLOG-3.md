Finally, the Robot Framework post you've all been waiting for!  

This is part 3 in a series of blog posts meant to get you started with automated testing using [Robot Framework](http://robotframework.org/).  If you haven't checked out the [other posts in the series](https://dev.to/dwwhalen/series/21110), please do.  This post builds on what I've discussed previously.

In this post we're going to build some Robot Framework automated tests for our web site.  What web site, you ask?  Well let's talk about that.

## Our application under test
Instead of pointing our tests to a public website, we're going to test a website that we host on our local machine.  The code for the sample site is part of the same code repo as our  Robot Framework tests, just like we'd do in the real world.

You can clone the repo from [here](https://github.com/dwwhalen/cypress-robot-todomvc).  

This repo was initially forked from a [Cypress sample app](https://github.com/cypress-io/cypress-example-todomvc). The sample ToDo application is a Node app, so you'll need to be sure to have Node and npm installed.  You can find details for that [here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).

Once you have cloned the app and installed Node, it's time to start the app:

```shell
## cd into the local cloned repo folder
cd cypress-robot-todomvc

## install the node_modules
npm install

## start the local webserver
npm start
```

If all goes as planned, you should see something like this:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/glbix7thzk6i5th0itfp.png)

Now just open your browser and go to `http//:localhost:8888`.  You should see the ToDo app, running locally on your machine:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/fhwry2tpcqjjiw3sz1ij.png)

Feel free to experiment with the site by manually adding and editing some ToDos items.  It's all running locally, with the ToDo items saved to your Local Storage.  

We're going to write a Robot Framework test for this application.

## Selenium library
[SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) is built specifically for Robot Framework.  It supports automated browser-based testing and leverages Selenium WebDriver modules.

In order to SeleniumLibrary in in your Robot Framework tests, you will first need to install it.  You can get detailed instructions for that process [here](https://github.com/robotframework/SeleniumLibrary#installation).

You'll also need the Selenium browser drivers installed, and the location of the drivers need to be in your PATH.  You can find more details for that process [here](https://github.com/robotframework/SeleniumLibrary#browser-drivers).

## Testing with the Selenium Library
With the preliminaries out of the way, it's time to create a test!

Let's start with the basics.  I think I want my first test to:
- open the ToDo page
- verify there are no ToDos
- add a ToDo
- verify there is 1 ToDo

Here is a pretty ugly version of that test, using Robot Framework:

```robot
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://localhost:8888
${BROWSER}      Chrome

***Test Case***
Open ToDo Page
  Open Browser    ${URL}  ${BROWSER}
  Page Should Not Contain Element  //section[@class='main']
  Input text  class: new-todo  Finish This Blog Post
  Press Keys  class: new-todo  RETURN
  Page Should Contain Element  //section[@class='main']
  ${actual_count}=  SeleniumLibrary.Get Element Count  //ul[@class='todo-list']/li
  ${expected_count_number}=  Convert To Number  1
  Should Be Equal  ${expected_count_number}  ${actual_count}
```

The new thing here is the use of the SeleniumLibrary, which is referenced in `Settings` section:

````robot
*** Settings ***
Library    SeleniumLibrary
```

Including that library gives us the power of all of its built-in keywords.  For example, the `Open Browser` keyword, which accepts 2 parameters, the browser to open, and the URL to navigate to.
```robot
Open Browser    ${URL}  ${BROWSER}
```

The remaining keywords are pretty self-explanatory.  As you might expect, there are many many more keywords available, and they're all documented [here](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html).


## Running the test
The best way to really get comfortable with what's going on with this first test is to run it yourself.  Once you can run it locally and it's green, change it up and see what happens.

This test is part of the repo that you cloned, and can be found [here](https://github.com/dwwhalen/cypress-robot-todomvc/blob/master/robot-framework/e2e/suites/ToDos_basic1.robot).  

As I said, that test is ugly and it's not how I would recommend doing it in the real world.  To make it more readable, I'd want the code complexity to be in a separate resource file.  I'll revisit this test in a future post.

To run it locally:
`robot robot-framework/e2e/suites/BasicTest.robot`

With a little effort and determination, I'm sure you'll eventually get a green test.

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/5rmqcja2l2o7ygm6p8hc.png)

(Also, don't forget to start your website, as described previously.  Someone I know forgot to do that and spent a little more time than he should have figuring out the issue!  Oh yeah, that someone was me!)

## Wrap-up

That's it for now.  I thought this would be the final post in my Robot Framework series, but I have a couple more things I want to touch on, so stay tuned!

