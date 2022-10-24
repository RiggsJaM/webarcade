Feature: SeedRandomWordInHangman

  Scenario: Generate a random word from the word list
    Given the Hangman page is running
    When I call the generate word function
    Then the generate word function returns a word from the wordlist