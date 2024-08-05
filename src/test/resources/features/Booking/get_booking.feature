#autor: Isaias Caleb Asis Luna
Feature: Get booking from the page https://restful-booker.herokuapp.com/

  Background:
    * call read("create_booking.feature@Success")
    * header Accept = 'application/json'

    #Escenario satisfactorio
  @Success
  Scenario: consult a booking
    Given url "https://restful-booker.herokuapp.com" + "/booking/" + bookingId
    When method GET
    When print response
    Then status 200

    #Escenario no controlado
  @SuccessNotFound
  Scenario: Check reservation with parameter not found
    Given url "https://restful-booker.herokuapp.com" + "/booking/" + "xxxxxxxx"
    When method GET
    When print response
    Then status 404
    And match response contains 'Not Found'

  @BookingIdEmpty
  Scenario: Check reservation with parameter not found
    Given url "https://restful-booker.herokuapp.com" + "/booking/"
    When method GET
    When print response
    Then status 200
