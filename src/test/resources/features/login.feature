Feature: Login

  Scenario: Successful login with valid credentials
    Given user is on login page
    When user enters valid username "standard_user" and password "secret_sauce"
    Then user is navigated to the homepage