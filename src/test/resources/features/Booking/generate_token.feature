#autor: Isaias Caleb Asis Luna
Feature: Obtain token to generate requests from the page https://restful-booker.herokuapp.com/

  Background:
    * header Content-Type = 'application/json'
    * string body = read('classpath:data/booking/generateToken/body.json')

  @Success
  Scenario: Obtain token
    Given url "https://restful-booker.herokuapp.com/auth"
    And request  body
    When method POST
    When print response
    Then status 200
    And def token = $.token