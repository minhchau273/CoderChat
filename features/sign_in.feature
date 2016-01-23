@javascript
Feature: Sign in
  I want to sign in

  Background:
    Given I am at Login page
    And There is a registered user

  Scenario: Input invalid email
    When I input invalid email to sign in
    And I input correct password to sign in
    When I click "Sign In"
    Then I can see error message

  Scenario: Input valid email and incorrect password
    When I input valid email to sign in
    And I input incorrect password to sign in
    When I click "Sign In"
    Then I can see error message

  Scenario: Input valid email and correct password
    When I input valid email to sign in
    And I input correct password to sign in
    When I click "Sign In"
    Then I can see my email
