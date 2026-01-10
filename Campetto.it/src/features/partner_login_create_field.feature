Feature: Field search and booking
  In order to create a sport field
  A registered partner should be able to login and create a field in his dashboard

  Scenario: Registered partner logs in his dashboard and create a Padel field
    Given I have a confirmed partner
    When I visit the partner login page
    And I fill in "session_email" with "partner@example.com"
    And I fill in "session_password" with "Password@1"
    And I click on "Accedi"
    Then I should be redirected to partner dashboard