Cucumber BDD Testing with Flutter
=================================


*Please note, our project has already updated the pubspec.yaml file, but if you want to use Gherkin in other projects, this is the best way to do so.

*Also note, if you're using VS Code, be sure to save as often as possible, as code generation might not happen until you save the .feature files. Keep this in mind if using VS Code. 


---

For now, research is happening with the bdd_widget_test package. 

There is a package called flutter_gherkin that could be added, but as it appears, using gherkin like one would in virtually any other language is quite problematic with Flutter. This is because the practice of Reflections or Mirroring is verboten by default. The package at https://pub.dev/packages/flutter_gherkin seems to document well how one might use Gherkin with that package, but for now, we'll just be using it for Widget testing. 

---


If you want more information on bdd_widget_test check out the following link: 
https://pub.dev/packages/bdd_widget_test

Add the following packages under dev_dependencies in your pubspec.yaml file: 
 
    bdd_widget_test: ^1.4.2 # Most recent version
    build_runner: ^2.2.1 # Most recent version


This will require you to update dart. Do this in a terminal with:

    flutter pub get

Once bdd_widget_test and build_runner are installed, you should be able to run the build)runner process (also in a terminal) which will automatically update the dart files. *BOOM*


---


In the test folder, create a file called test_page.feature

If the bdd_widget_test package is installed, this file will auto-populate with the cucumber logo, next to the tests_page.feature file.

We will also want a tests_page.dart file in our lib/screens folder, to go along with it. The sample code from flutter will suffice, just needs a little bit of modification, and then the link added to the homepage. 

In the tests_page.feature file, add the following lines of code:


    Feature: Counter


    Scenario: Initial counter value is 0
        Given the app is running
        Then I see {'0'} text

    

At this point, the Gherkin code is there, but it's not doing anything. Please recall, we added bdd_widget_test to our pubspec.yaml file, so when we run the following command everything should automatically be populated for us in a new test file called tests_page_test.dart 

To do so, do one of the following:

    Either open a terminal (powershell, cmd, xterm, etc)

        or
    
    Use the terminal in your IDE, either Android Studio or VS Code. 


Once you've got a terminal open, and have navigated to the directory where your pubspec.yaml file lives, you will run the following build_runner command to create the corresponding test files:

    flutter pub run build_runner watch --delete-conflicting-outputs


Whichever terminal you chose, that process will remain running, so do not close it. You should be able to just write and save the .feature files, and then the build_runner will automatically populate the appropriate test files. If this isn't the case, simply close the terminal, and rerun the above command.

For this reason, I recommend against using Android Studio's built in terminal for this. It works most of the time, but it's a bit more complicated to close, and using a PowerShell window or other Terminal is just easier to maintain. 


This step should take a few seconds to complete. After you update any .feature files, it won't take as long, but it will initially take a while.


Simply open the tests_page_test.dart file, click the run icon next to your newly generated tests, and see the results!