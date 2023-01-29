Finally, the Robot Framework post you've all been waiting for!  

This is part 3 in a series of blog posts meant to get you started with automated testing using [Robot Framework](http://robotframework.org/).  If you haven't checked out [other posts in the series](https://dev.to/dwwhalen/series/21110), please do.  This post builds on what I've discussed previously.

In this post we're going to build some Robot Framework automated tests for our web site.  What web site, you ask?  Well let's talk about that.

## Our application under test
Instead of pointing our tests to a public sample website, we're going to test a website that we host on our local machine.  The code for the sample site is part of the same code repo as our  Robot Framework tests, just like we'd do in the real world.

You can clone the repo from [here](https://github.com/dwwhalen/cypress-robot-todomvc).  

This repo was initially forked from a Cypress sample app. The sample ToDo application is a Node app, so you'll need to be sure to have Node and npm installed.  You can find details for that [here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).

Once you have cloned the app and installed Node, it's time to start the app:

```
## cd into the local cloned repo folder
cd cypress-robot-todomvc

## install the node_modules
npm install

## start the local webserver
npm start
```

This should start the ToDo app locally on your machine.  If all goes as planned, you should see something like this once you run `npm start`:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/glbix7thzk6i5th0itfp.png)

Now just open your browser and go to [http//:localhost:8888]().  You should see the ToDo app, running locally on your machine:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/fhwry2tpcqjjiw3sz1ij.png)

Feel free to experiment with the site by manually adding and editing some ToDos items.  It's all running locally, with the ToDo items saved to your Local Storage.  We're going to write some Robot Framework tests for this application.

## Selenium library
[SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) is built specifically for Robot Framework.  It supports automated browser-based testing and leverages Selenium WebDriver modules.

In order to SeleniumLibrary in in your Robot Framework tests, you will first need to install it.  You can get detailed instructions for that process [here](https://github.com/robotframework/SeleniumLibrary#installation).

You'll also need the Selenium browser drivers installed, and the location of the drivers need to be in your PATH.  You can find more details for that process [here](https://github.com/robotframework/SeleniumLibrary#browser-drivers).

## Testing with the Selenium Library
With the preliminaries out of the way, it's time to create a test!



## Wrap-up