Feature: TestsPage


  Scenario: Initial counter value is 0
    Given the app is running
    Then I see {'0'} text



  Scenario: Plus button increases the counter value
    Given the app is running
    When I tap{Icons.add} icon



  Scenario: The text is BDD rules when the counter value is 3
    Given the app is running
    When I tap {Icons.add} icon
    And I tap {Icons.add} icon
    And I tap {Icons.add} icon
    Then I don't see {'3'} text
    And I see {'BDD Rules!'} text
    When I tap {Icons.add} icon
    Then I see {'4'} text

