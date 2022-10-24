Feature: DefinitionToString

  Scenario: Create a To String function for the long definition
    Given the api request was successful
    When I call definition's to string method
    Then I get a valid string