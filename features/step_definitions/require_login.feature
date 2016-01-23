@javascript
Feature: Require log in
  I visit Home page without logging in

  Scenario: Visit Home page without logging in
    When I am at Home page
    Then I can see error message about logging in
