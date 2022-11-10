# Testing

The framework we are using to develop the project, Flutter, has its own built in testing framework for unit, integration, and widget tests. Flutter also reccomends using Mockito when testing anything that needs to be mocked and has a guide on how to create tests using it.

Flutter's testing is not without its quirks.

For example, when running multiple tests in a file (especially widget tests) Flutter will create an instance of a page being tested, and then keep testing that 1 instance instead of creating a new one for each test.

This behavior is not guaranteed, and sometimes the tests will run fine, despite being on the same instance, and sometimes, they will not.

The easiest way to get around this issue is to create a separate (filename)_test.dart file and have 1 test in that file, or multiple if they will only run being 1 after the other. It will basically be trial and error to determine what tests will need to be isolated to their own file and which can be run together.

## Manual Testing

Some elements may be difficult to test with code or will also need manual testing.

These elements will be tested by one of us running the program and testing it as if we were a user.


## Running The Tests

In order to run all the tests, in a terminal, go to the project, then cd to the src directory.

Next, run the below command to run all the tests in the project.

    flutter test


If you want to run all the tests in a specific directory do the below command.

This command runs all the tests in the "hangman_tests" directory.

    flutter test test/hangman_tests


To run a specific test, do the below command.

This command runs a specific test in the "hangman_tests" directory.

    flutter test test/hangman_tests/keyboard_test.dart


There is no way to run all the tests using the run button in the IDE unless they are all in the same dart file.

