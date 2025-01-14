Feature: API Testing for ReqRes Users API

  Background:
    # Define the base URL for the ReqRes API
    * url 'https://reqres.in/api/users'
    * header Content-Type = 'application/json'

    # Define metadata for reporting
    * def projectName = 'ReqResAPI'
    * def buildId = 'Build_001'
    * def testSuiteName = 'User_CRUD_Tests'
    * def framework = 'KARATE'
    * def testType = 'API'
    * def tester = 'Pranjal Barot'
    * def apiType = 'REST'
    * def environment = 'QA'
    * def startTime = new java.util.Date()

  Scenario: Create a new user
    Given url 'https://reqres.in/api/users'
    And request { "name": "John Doe", "job": "Engineer" }
    When method POST
    Then status 201
    And match response contains { "name": "John Doe", "job": "Engineer", "id": "#notnull", "createdAt": "#notnull" }
    * def endTime = new java.util.Date()
    * def duration = (endTime.getTime() - startTime.getTime()) / 1000
    * def metadata =
      """
      {
        "projectName": "#(projectName)",
        "buildId": "#(buildId)",
        "testSuiteName": "#(testSuiteName)",
        "framework": "#(framework)",
        "testType": "#(testType)",
        "tester": "#(tester)",
        "apiType": "#(apiType)",
        "environment": "#(environment)",
        "status": "PASS",
        "duration": "#(duration)",
        "startTime": "#(startTime)",
        "endTime": "#(endTime)"
      }
      """
    * print 'Metadata:', metadata

  Scenario: Retrieve a single user
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response contains { "data": { "id": 2, "email": "#notnull", "first_name": "#notnull", "last_name": "#notnull", "avatar": "#notnull" } }
    * def endTime = new java.util.Date()
    * def duration = (endTime.getTime() - startTime.getTime()) / 1000
    * def metadata =
      """
      {
        "projectName": "#(projectName)",
        "buildId": "#(buildId)",
        "testSuiteName": "#(testSuiteName)",
        "framework": "#(framework)",
        "testType": "#(testType)",
        "tester": "#(tester)",
        "apiType": "#(apiType)",
        "environment": "#(environment)",
        "status": "PASS",
        "duration": "#(duration)",
        "startTime": "#(startTime)",
        "endTime": "#(endTime)"
      }
      """
    * print 'Metadata:', metadata

  Scenario: Update a user
    Given url 'https://reqres.in/api/users/2'
    And request { "name": "Jane Doe", "job": "Manager" }
    When method PUT
    Then status 200
    And match response contains { "name": "Jane Doe", "job": "Manager", "updatedAt": "#notnull" }
    * def endTime = new java.util.Date()
    * def duration = (endTime.getTime() - startTime.getTime()) / 1000
    * def metadata =
      """
      {
        "projectName": "#(projectName)",
        "buildId": "#(buildId)",
        "testSuiteName": "#(testSuiteName)",
        "framework": "#(framework)",
        "testType": "#(testType)",
        "tester": "#(tester)",
        "apiType": "#(apiType)",
        "environment": "#(environment)",
        "status": "PASS",
        "duration": "#(duration)",
        "startTime": "#(startTime)",
        "endTime": "#(endTime)"
      }
      """
    * print 'Metadata:', metadata

  Scenario: Delete a user
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    * def endTime = new java.util.Date()
    * def duration = (endTime.getTime() - startTime.getTime()) / 1000
    * def metadata =
      """
      {
        "projectName": "#(projectName)",
        "buildId": "#(buildId)",
        "testSuiteName": "#(testSuiteName)",
        "framework": "#(framework)",
        "testType": "#(testType)",
        "tester": "#(tester)",
        "apiType": "#(apiType)",
        "environment": "#(environment)",
        "status": "PASS",
        "duration": "#(duration)",
        "startTime": "#(startTime)",
        "endTime": "#(endTime)"
      }
      """
    * print 'Metadata:', metadata
