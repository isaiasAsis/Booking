#autor: Isaias Caleb Asis Luna
Feature: Update reservation on the page https://restful-booker.herokuapp.com/

  Background:
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * call read("generate_token.feature@Success")
    * call read("create_booking.feature@Success")
    * string successPut = read('classpath:data/booking/updateBooking/successPut.json')

    #Escenario satisfactorio
  @Success
  Scenario: update a booking
    Given header Cookie = "token=" + token
    And print bookingId
    And url "https://restful-booker.herokuapp.com" + "/booking/" + bookingId
    And request successPut
    When method PUT
    When print response
    Then status 200

    #Escenario No controlado
  @BookingNotFound
  Scenario: Update unregistered reservation
    Given header Cookie = "token=" + token
    And print bookingId
    And url "https://restful-booker.herokuapp.com" + "/booking/" + "xxxx"
    And request successPut
    When method PUT
    When print response
    Then status 405

  @BookingIdEmpty
  Scenario: update reservation with empty bookingId parameter
    Given url "https://restful-booker.herokuapp.com" + "/booking/"
    When method PUT
    When print response
    Then status 404
    And match response contains 'Not Found'