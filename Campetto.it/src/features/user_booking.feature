Feature: Field search and booking
  In order to play at a sports field
  A logged-in user should be able to search and book a field

  Background:
    Given a field with the following details:
      | nome         | Tennis Colosseo         |
      | descrizione  | Campo vicino al Colosseo|
      | sport        | Tennis                  |
      | prezzo       | 50.00                   |
      | latitudine   | 41.890251               |
      | longitudine  | 12.492373               |
      | start_time   | 10:00                   |
      | end_time     | 19:00                   |
      | interval     | 60                      |
      | exclude_days | Sunday                  |
      | indirizzo    | Piazza del Colosseo, 1  |
      | via          | Piazza del Colosseo     |
      | citta        | Roma                    |
      | cap          | 00184                   |
    And I am logged in as a confirmed user with email "test@example.com" and password "Password123!"

    Scenario: User searches for a field and books it
        Given I visit the root path
        When I fill in "indirizzo" with "Roma"
        And I select "Tennis" from "sport"
        And I fill in "data" with "2024-11-05"
        And I click on "Cerca"
        Then I should see "Tennis Colosseo"
        When I click on field "Tennis Colosseo"
        And I should see "05/11/2024 10:00 - 11:00"
        Then I click on the book button for the slot "05/11/2024 10:00 - 11:00"