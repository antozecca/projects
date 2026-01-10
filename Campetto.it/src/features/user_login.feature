Feature: User Confirmation and Login

  Scenario: User confirms account successfully
    Given I have registered a user with email "test@example.com" and password "Password123!"
    When I visit the confirmation link with token "confirmation_token_here" 
    And I should be redirected to login page

  Scenario: User logs in successfully
    Given I have confirmed a user with email "test@example.com" and password "Password123!"
    When I visit login page
    And I fill in "email_login" with "test@example.com"
    And I fill in "password_login" with "Password123!"
    And I click on "Login"
    Then I should be redirected to account page
    And I should see "Accesso effettuato con successo."
    Then I should see "Ciao test@example.com"

  Scenario: User tries to log in without confirming account
    Given I have registered a user with email "test2@example.com" and password "Password123!"
    When I visit login page
    And I fill in "email_login" with "test2@example.com"
    And I fill in "password_login" with "Password123!"
    And I click on "Login"
    Then I should be redirected to login page

    Scenario: User visits their account page while logged in
    Given I am logged in as a confirmed user with email "test@example.com" and password "Password123!"
    When I visit my account page
    Then I should see "Ciao test@example.com"
