#autor: Isaias Caleb Asis Luna
Feature: Delete a reservation from the page https://restful-booker.herokuapp.com/

  Background:
    * call read("create_booking.feature@Success")
    * header Cookie = 'application/json'
    * header Authorization = "Basic YWRtaW46cGFzc3dvcmQxMjM="

    #Escenario satisfactorio
  @Success
  Scenario: delete a booking
    Given url "https://restful-booker.herokuapp.com" + "/booking/" + bookingId
    When method DELETE
    And print response
    Then status 201
    And match response contains 'Created'

 #Escenario no conrtrolado
  @BookingNotFound
  Scenario: Delete an unregistered reservation
    Given url "https://restful-booker.herokuapp.com" + "/booking/" + "xxxxx"
    When method DELETE
    And print response
    Then status 405

  @BookingIdEmpty
  Scenario: Delete reservation with empty bookingId parameter
    Given url "https://restful-booker.herokuapp.com" + "/booking/"
    When method DELETE
    When print response
    Then status 404
    And match response contains 'Not Found'