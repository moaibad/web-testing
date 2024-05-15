package com.a1.webtesting.stepdefinitions;

import com.a1.webtesting.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class LoginSteps {
    LoginPage loginPage;

    @Given("pengguna membuka halaman saucedemo pada browser")
    public void user_open_page() {
        Hooks.driver.get("https://www.saucedemo.com/");
        loginPage = new LoginPage(Hooks.driver);
    }

    @And("pengguna berada pada halaman login yang berisikan form username dan password")
    public void user_on_login_page(){
        assertTrue(loginPage.isOnLoginPage());
    }

    @When("pengguna mengisi username {string} dan password {string}")
    public void user_enter_username_and_password(String username, String password) {
        loginPage.enterUsername(username);
        loginPage.enterPassword(password);
    }

    @And("pengguna menekan tombol login")
    public void user_click_login_button(){
        loginPage.clickLoginButton();
    }

    @Then("pengguna berhasil melakukan login dan menampilkan halaman Dashboard")
    public void user_login_success_and_navigated_to_the_homepage() {
        String expectedUrl = "https://www.saucedemo.com/inventory.html";
        assertEquals(expectedUrl, loginPage.getCurrentUrl());
    }

    @Then("pengguna gagal melakukan login dan terdapat error message {string}")
    public void user_login_failed_and_show_error_message(String errorMessage) {
        String actualErrorMessage = loginPage.getErrorMessage();
        assertTrue(actualErrorMessage.contains(errorMessage));
    }
}
