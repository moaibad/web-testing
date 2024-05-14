package com.a1.webtesting.stepdefinitions;

import com.a1.webtesting.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.Assert.assertEquals;

public class LoginSteps {
    LoginPage loginPage;

    @Given("user is on login page")
    public void user_is_on_login_page() {
        Hooks.driver.get("https://www.saucedemo.com/");
        loginPage = new LoginPage(Hooks.driver);
    }

    @When("user enters valid username {string} and password {string}")
    public void user_enters_valid_username_and_password(String username, String password) {
        loginPage.enterUsername(username);
        loginPage.enterPassword(password);
        loginPage.clickLoginButton();
    }

    @Then("user is navigated to the homepage")
    public void user_is_navigated_to_the_homepage() {
        String expectedUrl = "https://www.saucedemo.com/inventory.html";
        assertEquals(expectedUrl, loginPage.getCurrentUrl());
    }
}
