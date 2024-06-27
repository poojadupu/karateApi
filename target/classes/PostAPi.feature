Feature: Validation of POST request API

  @api-post
 Scenario: using dummay api validate post request
    Given url 'https://dummy.restapiexample.com/api/v1/create'
  And request 	{"name":"test","salary":"123","age":"23"}
   When method post
    Then status 200