@Login
Feature: Login

  Scenario: Login menggunakan username dan password yang terdaftar pada sistem
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "standard_user" dan password "secret_sauce"
    And pengguna menekan tombol login
    Then pengguna berhasil melakukan login dan menampilkan halaman Dashboard


  Scenario: Login menggunakan username yang terdaftar pada sistem dan password yang tidak terdaftar pada sistem
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "standard_user" dan password "cinderella"
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Username and password do not match any user in this service"

  Scenario: Login menggunakan password yang terdaftar pada sistem dan username yang tidak terdaftar pada sistem
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "cinderella" dan password "secret_sauce"
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Username and password do not match any user in this service"

  Scenario: Login menggunakan username dan password yang tidak terdaftar pada sistem
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "cinderella" dan password "boo"
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Username and password do not match any user in this service"

  Scenario: Login menggunakan username yang terdaftar pada sistem dan password kosong
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "standard_user" dan password ""
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Password is required"

  Scenario: Login menggunakan username yang tidak terdaftar pada sistem dan password kosong
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "cinderella" dan password ""
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Password is required"

  Scenario: Login menggunakan password yang terdaftar pada sistem dan username kosong
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "" dan password "secret_sauce"
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Username is required"

  Scenario: Login menggunakan password yang tidak terdaftar pada sistem dan username kosong
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna mengisi username "" dan password "boo"
    And pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Username is required"

  Scenario: Login dengan username dan password kosong
    Given pengguna membuka halaman saucedemo pada browser
    And pengguna berada pada halaman login yang berisikan form username dan password
    When pengguna menekan tombol login
    Then pengguna gagal melakukan login dan terdapat error message "Username and Password is required"