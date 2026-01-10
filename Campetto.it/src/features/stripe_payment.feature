Feature: Stripe Payment
  Scenario: User completes a payment
    Given I am a registered user
    When I enter valid payment details
    Then a Stripe charge should be created

