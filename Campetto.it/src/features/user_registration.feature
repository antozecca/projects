Feature: User Registration

  Scenario: Successful user registration
    Given I am on the signup page
    When I fill in "signup_email" with "test@example.com"
    And I fill in "signup_password" with "Password123!"
    And I fill in "conferma_password" with "Password123!"
    And I check "policy"
    When I click on "Registrazione"
    And a user with email "test@example.com" should exist

  Scenario: Unsuccessful user registration with empty email
    Given I am on the signup page
    When I fill in "signup_email" with ""
    And I fill in "signup_password" with "Password123!"
    And I fill in "conferma_password" with "Password123!"
    And I check "policy"
    When I click on "Registrazione"
    Then I should not see a new user in the database

  Scenario: Unsuccessful user registration with non-matching passwords
    Given I am on the signup page
    When I fill in "signup_email" with "test2@example.com"
    And I fill in "signup_password" with "Password123!"
    And I fill in "conferma_password" with "PasswordMismatch!" 
    And I check "policy"
    When I click on "Registrazione"
    And I should not see a new user in the database