@api_test_students
Feature: Student Records Management

  Background:
    * url baseUrl
    # Enviamos la API Key en todas las peticiones de este archivo
    * header x-api-key = apiKey 

  Scenario: Retrieve student records with specific filters
    Given path 'api', 'collections', 'students', 'records'
    # Definimos los query parameters (?project_id=1270&limit=25)
    And params { project_id: 1270, limit: 25 }
    When method get
    Then status 200
    * def records = response
    * print 'Records are:', records
    And match records.data == '#array'
    And match records.data == "#notnull"

  Scenario: Retrieve a single student record by ID
    Given path 'api', 'collections', 'students', 'records', 'd40e5efc-d903-4df9-8ef7-2368a4c5e24c'
    And params { project_id: 1270 }
    When method get
    Then status 200
    * def record = response
    * print 'Record is:', record
    And match record.data.data.id == 103
    And match record.data.data.fullName == 'Catherine Lopez'
    And match record.data.data.courses == ['Strategic Management', 'International Trade']
    And match record.data.data.enrollment == 
    """
    {
      "isActive": false,
      "semester": 10 
    }
    """

  Scenario: Create a new student record
    * def newStudent = 
    """
    {
      "id": 12345,
      "age": 19,
      "gpa": 3.4,
      "major": "Mechanical Engineering",
      "courses": [
        "Calculus II",
        "Physics I",
        "Thermodynamics"
      ],
      "fullName": "Tereza Novak",
      "enrollment": {
        "isActive": true,
        "semester": 5
      }
    }
    """
    Given path 'api', 'collections', 'students'
    And params { project_id: 1270 }
    And request newStudent
    When method post
    Then status 201
    * def record = response
    * print 'Record is:', record
  