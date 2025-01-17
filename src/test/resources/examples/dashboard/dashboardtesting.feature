Feature: API Testing for ReqRes Users API

  Background:
    * url 'https://reqres.in/api/users'
    * header Content-Type = 'application/json'
    * def projectName = 'ReqResAPI'
    * def buildId = 'Build_001'
    * def testSuiteName = 'User_CRUD_Tests'
    * def framework = 'KARATE'
    * def testType = 'API'
    * def tester = 'Pranjal Barot'
    * def apiType = 'REST'
    * def environment = 'QA'
    * def startTime = new java.util.Date()
    * def stats = karate.callSingle('classpath:examples/dashboard/globalvars.feature').stats



    # Correct way to define an after hook using the scenario argument
    * configure afterScenario =
      """
      function() {
      // Extract scenario and feature details
        var scenarioName = karate.scenario.name;
        var scenarioStatus = karate.scenario.failed;
        var scenarioLine = karate.scenario.line;
        var scenarioDurationMillis = karate.scenario.durationMillis;
        var scenarioDescription = karate.scenario.description;
   //   karate.log(Object.keys(karate.response));
     //  karate.log(karate.request.header);


      // Get feature-level details
        var featureName = karate.getFeature().name;
        var featureFileName = karate.getFeature().fileName;

      // Fetch HTTP request and response data (via pre-set variables)
      // Log the relevant request data

        var httpMethod = karate.request.method;  // GET / POST
        var requestUrl = karate.request.url;     // URL
        var requestHeaders = karate.request.header;  // Request Headers
        var requestBody = karate.request.bodyString;  // Request Body (as string)
        var responseStatus = karate.response.status;
        var responseHeaders = karate.response.header;
        var responseBody = karate.response.body;

      // Process and log additional information using Karate functions
        var logMessage = karate.toString({
          scenarioName: scenarioName,
          featureName: featureName,
          scenarioStatus: scenarioStatus ? 'Failed' : 'Passed',
          scenarioLine: scenarioLine,
          scenarioDurationMillis: scenarioDurationMillis,
          responseStatus: responseStatus,
          responseBody: responseBody, // Pretty print response body
          httpMethod: httpMethod,
          requestUrl: requestUrl,
          requestHeaders: requestHeaders,
          requestBody: requestBody, // Convert request body to JSON string
          responseHeaders: responseHeaders
        });

      // Update stats based on scenario result
        if (!scenarioStatus) {
          stats.totalPassedCase++;
        } else {
          stats.totalFailedCase++;
        }

      // Increment total cases
        stats.totalCases++;

      // Log the detailed test execution summary
        karate.log('***************** After Scenario ****************************');
        karate.log(logMessage); // This includes structured information
        karate.log('Total Cases:', stats.totalCases);
        karate.log('Total Passed Cases:', stats.totalPassedCase);
        karate.log('Total Failed Cases:', stats.totalFailedCase);

      }
      """


  Scenario: Fetch a user
    Given url 'https://gorest.co.in/public/v2/users'
    When method get
    Then status 200

  Scenario: Create a new user
    Given url 'https://reqres.in/api/users'
    And request { "name": "John Doe", "job": "Engineer" }
    And headers { 'Content-Type': 'application/json', 'Authorization': 'Bearer token' }
    When method POST
    Then status 201
    And match response contains { "name": "John Doe", "job": "Engineer", "id": "#notnull", "createdAt": "#notnull" }

  Scenario: Retrieve a single user
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response contains { "data": { "id": 2, "email": "#notnull", "first_name": "#notnull", "last_name": "#notnull", "avatar": "#notnull" } }

  Scenario: Update a user
    Given url 'https://reqres.in/api/users/2'
    And request { "name": "Jane Doe", "job": "Manager" }
    When method PUT
    Then status 200
    And match response contains { "name": "Jane Doe", "job": "Manager", "updatedAt": "#notnull" }

  Scenario: Delete a user
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204

