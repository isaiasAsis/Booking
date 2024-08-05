#autor: Isaias Caleb Asis Luna
Feature: Create reservation on the page https://restful-booker.herokuapp.com/

  Background:
    * url api.baseUrl
    * path createPath = "/booking"
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

    * string success = read('classpath:data/booking/createBooking/success.json')
    * string firstNameEmpty = read('classpath:data/booking/createBooking/firstNameEmpty.json')
    * string lastNameEmpty = read('classpath:data/booking/createBooking/lastNameEmpty.json')
    * string totalpriceValueZero = read('classpath:data/booking/createBooking/totalpriceValueZero.json')
    * string depositpaidFalse = read('classpath:data/booking/createBooking/depositpaidFalse.json')
    * string checkinEmpty = read('classpath:data/booking/createBooking/checkinEmpty.json')
    * string checkoutEmpty = read('classpath:data/booking/createBooking/checkoutEmpty.json')
    * string additionalneedsEmpty = read('classpath:data/booking/createBooking/additionalneedsEmpty.json')
    * string parametersEmpty = read('classpath:data/booking/createBooking/parametersEmpty.json')
    * string firstnameNumber = read('classpath:data/booking/createBooking/firstnameNumber.json')
    * string manycharactersLastName = read('classpath:data/booking/createBooking/manycharactersLastName.json')
    * string specialCharacters = read('classpath:data/booking/createBooking/specialCharacters.json')
    * string numericalParameters = read('classpath:data/booking/createBooking/numericalParameters.json')
    * string nullParameters = read('classpath:data/booking/createBooking/nullParameters.json')

    #Escenario satisfactorio
  @Success
  Scenario: Successfully create reservation
    Given print success
    And request success
    When method POST
    And print response
    Then status 200
    And def bookingId = $.bookingid

    #Escenario no controlado
  @firstNameEmpty
  Scenario: Create reservation with empty firstname parameter
    Given print firstNameEmpty
    And request firstNameEmpty
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @lastNameEmpty
  Scenario: Create reservation with empty lastname parameter
    Given print lastNameEmpty
    And request lastNameEmpty
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @totalpriceValueZero
  Scenario: Create reservation with parameter totalprice value zero
    Given print totalpriceValueZero
    And request totalpriceValueZero
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @depositpaidFalse
  Scenario: Create reservation with parameter depositpaid false
    Given print depositpaidFalse
    And request depositpaidFalse
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @checkinEmpty
  Scenario: Create reservation with empty checkin parameter
    Given print checkinEmpty
    And request checkinEmpty
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @checkoutEmpty
  Scenario: Create reservation with empty checkoutEmpty parameter
    Given print checkoutEmpty
    And request checkoutEmpty
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @additionalneedsEmpty
  Scenario: Create reservation with empty additionalneeds parameter
    Given print additionalneedsEmpty
    And request additionalneedsEmpty
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @parametersEmpty
  Scenario: Create reservation with empty parameters
    Given print parametersEmpty
    And request parametersEmpty
    When method POST
    And print response
    Then status 200


   #Escenario no controlado
  @manycharactersLastName
  Scenario: Create reservation with more than 100 characters in the lastname parameter
    Given print manycharactersLastName
    And request manycharactersLastName
    When method POST
    And print response
    Then status 200

    #Escenario no controlado
  @specialCharacters
  Scenario: Create reservation with special characters in the additionalneeds parameter
    Given print specialCharacters
    And request specialCharacters
    When method POST
    And print response
    Then status 200

  #Escenario no controlado
  @numericalParameters
  Scenario: Create reservation with characters in numerical parameter totalprice
    Given print numericalParameters
    And request numericalParameters
    When method POST
    And print response
    Then status 200

  @nullParameters
  Scenario: Create reservation with null parameters
    Given print nullParameters
    And request nullParameters
    When method POST
    And print response
    Then status 500