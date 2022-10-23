






Feature: TestingApiCalls


  Scenario: Call the API, and get a 200 response from Server
    Given We're on the new_definition_page page
    When I call the getDefinition function with {"flutter"}
    Then I get a valid 200 response from the server


  Scenario: Parse already received response.
    Given We're on the new_definition_page page
    And we have already gotten a record
    When I call the parseJson function with {fetchedJson}
    Then I
