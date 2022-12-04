# Installing Robot Framework

[Robot Framework](http://robotframework.org/) is a test automation framework that utilizes the keyword-driven testing approach to drive the tests.

Robot Framework is implemented using Python and is OS independent.

# Useful links
[Robot Framework site](https://robotframework.org)

[Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

[Selenium Library Keywords](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

# Installing Robot Framework

Installing Robot Framework requires Python 3.6 or higher.
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#python-installation
```
pip install robotframework
robot --version
```

# Sections of a test suite file
- Variables
- Settings (Library, Resource, Suite Setup, Suite Teardown)
- Keywords 
- Suite Setup
- Test cases
- Suite teardown

# starting the ToDo application
`npm run start`

# Running a Robot test suite
`robot robot-framework/Calculator_Test_Suite.robot`

`robot robot-framework/ToDos_suite.robot`