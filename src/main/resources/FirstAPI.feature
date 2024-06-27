Feature: Triggering first API through karate

#  @api
#  Scenario: using weather get-API getting the details of London city
#    Given url 'https://api.openweathermap.org/data/2.5/weather?q=London&appid=4ec2d983f3176dd6da1a1b9da5a036ed'
#    When method get
#    Then status 200
#    And match response.weather[0].description contains 'overcast clouds'
#    And match response.weather[0].description !contains 'pooja'
#    And match response.weather[0].description == '#string'
#    And match response.weather[0].description != '#number'

    @api2
  Scenario Outline: using weather get-API getting the details of London city

    Given url '<Url>'
    When method get
    Then status 200
    And def description = response.weather[0].description
    Then print description

    Examples:
      |Url|
      |https://api.openweathermap.org/data/2.5/weather?q=London&appid=4ec2d983f3176dd6da1a1b9da5a036ed|
      |https://api.openweathermap.org/data/2.5/weather?q=London&appid=4ec2d983f3176dd6da1a1b9da5a036ed|
      |https://api.openweathermap.org/data/2.5/weather?q=London&appid=4ec2d983f3176dd6da1a1b9da5a036ed|

  @api-all-data
  Scenario: using dummy api validate all the data of the response
    Given url 'https://dummy.restapiexample.com/api/v1/employees'
    When method get
    Then status 200
    And match each response.data ==
    """
    {

      "id": "#number",
      "employee_name": "#string",
      "employee_salary": "#number",
      "employee_age": "#number",
      "profile_image": "##string"
      }
    """