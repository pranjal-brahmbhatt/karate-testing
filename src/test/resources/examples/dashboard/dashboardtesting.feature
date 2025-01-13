Feature: API Testing with Digy Reporting

Background:
  # Define the base URL for your API (replace with actual URL)
  * url 'https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod'

  # Define common headers, such as authentication if needed
  * header Content-Type = 'application/json'
  * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0biI6ImV5SnJhV1FpT2lKR1lub3hXbU5GVjI1elRrRmtlbmxvUjFkVFoyOUxOa3BsV1ZOWlZXWllUMUpuTlZWMVducE1TRkZ2UFNJc0ltRnNaeUk2SWxKVE1qVTJJbjAuZXlKemRXSWlPaUpsT0RsbFpEa3hOUzB6TmpKbExUUm1Nemd0WW1ZMU1pMDJaRGRpTlRCbE1EQmpNMklpTENKcGMzTWlPaUpvZEhSd2N6cGNMMXd2WTI5bmJtbDBieTFwWkhBdWRYTXRaV0Z6ZEMweExtRnRZWHB2Ym1GM2N5NWpiMjFjTDNWekxXVmhjM1F0TVY5QlVVSkxZM1JMTjNZaUxDSmpiR2xsYm5SZmFXUWlPaUl4ZG1zeGFtSjJaMmsxY3pCbGFUUjJOMlZtWVdSME5EZzBaaUlzSW05eWFXZHBibDlxZEdraU9pSmtOVEV4WWpoaU5pMHhZMkpsTFRRd01tWXRPV0kwWlMxa1lXUmpNamN4WVdNellUa2lMQ0psZG1WdWRGOXBaQ0k2SWpFMU1HTTFNRGs1TFRKaVkyRXROREF3WXkwNFltSTRMVEk1WkRKa016ZGlOall4WXlJc0luUnZhMlZ1WDNWelpTSTZJbUZqWTJWemN5SXNJbk5qYjNCbElqb2lZWGR6TG1OdloyNXBkRzh1YzJsbmJtbHVMblZ6WlhJdVlXUnRhVzRpTENKaGRYUm9YM1JwYldVaU9qRTNNelkzTWprMk9UWXNJbVY0Y0NJNk1UY3pOamN6TXpJNU5pd2lhV0YwSWpveE56TTJOekk1TmprMkxDSnFkR2tpT2lJeE1Ea3hOVGRsTmkxbE1XWTVMVFJsTTJNdE9HUXlZUzFoWVdRNU1qQTVZMll4TWpraUxDSjFjMlZ5Ym1GdFpTSTZJbVJwWjNscmRXSmxJbjAua1ZYb1FSWG5GSEo1M3VDQmZ5cjVfX3NQbEFWb3hrMm85eTZLZFZ2RThRU05vUU56U0lVNGtfMG1PdDllSXlybkdqb0g5LXdIejl2TVVJQmlIVVBjV0FVMm5UZVVfYnBEQzhtRFZhOGZKRWJpWC1oeU1FZktrOEVsa2k3cjBXeXFIbXVnalB6RE9TR1dLdHRMWW9CR2hyYXhvTm85aDRiZ3FPVDdoRlRKeHJRa1hSVWVJVlhMRi1fRlNiZmlTSDFVMkhkZ3VXbndMVFFybHR2eDRYOXpOVmVyeldNXzF6VUVUOWVEZ3FkWWJkRjFFbTV6ZmRzYUZxcW5DSFhIaXl6SF96LTQ0ekdOQjJMQXMyaWFGWllNMHJ5S1FKekRhVHFNb3hOT3FrZWV1anJXUFd4R0JNa2cwZFpCTXdycWZVeTVLZUZZTFN1Zm5FNW5oU0w0cC1leklRIiwicmlkIjoiN2MzZjA2NGItNDgzZi00M2M4LWE2NDgtOGMzZjQwN2EzNmU0IiwicGVyIjpbInVzZXIuY3JlYXRlIiwidXNlci5hY3RpdmF0ZSIsInVzZXIuZGVhY3RpdmF0ZSIsInVzZXIubGlzdC5hdWRpdHRyYWlsLnZpZXciLCJ1c2VyLmxpc3QudmlldyIsInVzZXIubGlzdC5hc3NpZ25lZHByb2plY3QudmlldyIsInVzZXIudXBkYXRlIiwidXNlci5saXN0LmZpbHRlciIsInVzZXIucHJvZmlsZS52aWV3IiwidXNlci5wcm9maWxlLnBhc3N3b3JkLnVwZGF0ZSIsInVzZXIucHJvZmlsZS51cGRhdGUiLCJ1c2VyLnByb2ZpbGUudmlldyIsInVzZXIucHJvZmlsZS5wYXNzd29yZC51cGRhdGUiLCJ1c2VyLnByb2ZpbGUudXBkYXRlIiwidXNlci5wcm9qZWN0LmFkZCIsInVzZXIucHJvamVjdC5lZGl0IiwidXNlci51c2VycGxhbi5hZGQiLCJ1c2VyLnVzZXJwbGFuLnZpZXciLCJ1c2VyLnBsYW4udmlldyIsInVzZXIucGxhbi51cGRhdGUiLCJ1c2VyLmNhcmQudXBkYXRlIiwidXNlci5jYXJkLnZpZXciLCJ1c2VyLnBsYW4udmlldyIsInVzZXIucGxhbi5jYW5jZWwiLCJ1c2VyLnBsYW4ubGlzdC52aWV3IiwidXNlci5wbGFuLmxpc3QudXBkYXRlIiwicHJvamVjdC5jcmVhdGUiLCJwcm9qZWN0LmFjdGl2YXRlIiwicHJvamVjdC5kZWFjdGl2YXRlIiwicHJvamVjdC5saXN0LmF1ZGl0dHJhaWwudmlldyIsInByb2plY3QubGlzdC52aWV3IiwicHJvamVjdC5saXN0LmFzc2lnbmVkcHJvamVjdC52aWV3IiwicHJvamVjdC51cGRhdGUiLCJwcm9qZWN0Lmxpc3QuZmlsdGVyIiwidXNlci5yb2xlLnVwZGF0ZSIsImFjY2Vzcy5vcmcuYWRtaW4uYWxsb3ciLCJhY2Nlc3MucHJvamVjdC5yb2xlLmFsbG93IiwicHJvamVjdC52aWV3IiwidXNlci52aWV3IiwidXNlci5wdXJnZS5hZGQiLCJ1c2VyLnB1cmdlLnZpZXciLCJ1c2VyLnB1cmdlLnVwZGF0ZSIsImludGVncmF0aW9uLmxpc3QudmlldyIsImludGVncmF0aW9uLnZpZXciLCJpbnRlZ3JhdGlvbi5jcmVhdGUiLCJpbnRlZ3JhdGlvbi51cGRhdGUiLCJpbnRlZ3JhdGlvbi5kZWxldGUiLCJkYXNoYm9hcmQuY3JlYXRlIiwiZGFzaGJvYXJkLnVwZGF0ZSIsImRhc2hib2FyZC5kZWxldGUiXSwib3JnIjp7InBsYW5faWQiOiJwcm9kX080ZHJXRnNUdWJBbnY4Iiwic3Vic2NyaXB0aW9uX2lkIjoic3ViXzFRRDQ2T0Z3Y1ExSUluY1dVMVZTWUpKeSIsInN0YXR1cyI6ImFjdGl2ZSIsInJvb3RfdXNlciI6IjBlZWVjZjFkLWJhZTMtNGM0Zi1hZmIyLTI3N2NmYjllYzE1OSIsImlkIjoiMzVmZWI1ODUtNDJjNy00YjhmLTk0MzgtZTIxZTY2ZTczMGY0IiwibmFtZSI6ImRpZ3k0ZGlneWt1YmVjbG91ZCIsInN0cmlwZV9jdXN0b21lcl9pZCI6ImN1c19SNUVaQ2dEc0NseDNZMiIsInR5cGUiOiJlbnRlcnByaXNlIn0sInVzciI6eyJvcmdhbml6YXRpb25faWQiOiIzNWZlYjU4NS00MmM3LTRiOGYtOTQzOC1lMjFlNjZlNzMwZjQiLCJzdGF0dXMiOiJhY3RpdmF0ZSIsImNyZWF0ZWRBdCI6IjIwMjQtMTAtMjNUMTI6NTM6MzAuNTA3WiIsImVtYWlsIjoicGljYWhpNTk5OEBqYW1lYWdsZS5jb20iLCJsb2dpbl9hdHRlbXB0cyI6MCwibGFzdF9uYW1lIjoic2NhbGUiLCJmaXJzdF9uYW1lIjoiZGlneWt1YmUiLCJwaG9uZV9udW1iZXIiOiIrOTE5NjIzMjQyMzIyIiwidXNlcm5hbWUiOiJkaWd5a3ViZSIsImRlZmF1bHRfZGlneTRfZGFzaGJvYXJkIjoiaG9tZXBhZ2UiLCJpZCI6IjBlZWVjZjFkLWJhZTMtNGM0Zi1hZmIyLTI3N2NmYjllYzE1OSIsInJlbWVtYmVyX3Rva2VuIjoiIn0sInN1YiI6eyJzdGF0dXMiOiJ0cmlhbGluZyIsIm1ldGFkYXRhIjp7ImRlcGVuZGVudF9wbGFuIjoiZW50ZXJwcmlzZV9kaWd5NF9iYXNpYyIsImRlcGVuZGVudF9wbGFuX2lkIjoicHJvZF9PNGVCWWl4M2lyWkRtRiIsImRpc2NvdW50IjoiMjUiLCJmZWF0dXJlcyI6IlVuaXZlcnNhbCBSZXBvcnRpbmcgTXVsdGlwbGUgVG9vbHMgYW5kIEZyYW1ld29yayxVbml2ZXJzYWwgTG9nIENhcHR1cmUsU2NyZWVuc2hvdCwgVmlkZW9zLCBIaXN0b3JpY2FsIFRyZW5kLFRlc3QgRGV0YWlscyBWaWV3LCBNYW5hZ2VtZW50IFZpZXcsRmlsdGVycywgUHVyZ2luZywgQ3VzdG9tIFZpZXcsVXNlciBBZG1pbmlzdHJhdGlvbixSZXBvcnQgRG93bmxvYWQiLCJmcmVlX2Zvcl9ldmVyIjoidHJ1ZSIsImlzRnJlZVRyaWFsIjoidHJ1ZSIsImlzX3Byb21vdGlvbl9saXZlIjoiZmFsc2UiLCJwbGFuX3R5cGUiOiJlbnRlcnByaXNlIiwicHJvbW90aW9uX3ByaWNlIjoiMzc1MDAiLCJ0ZXN0Y2FzZV9jb3VudCI6IjUwMDAwIiwidXNlcl9jb3N0IjoiMjAwMCIsInVzZXJfY291bnQiOiIzIn19LCJpYXQiOjE3MzY3Mjk3MDF9.BesMAF_8Fx7SausWgeWi_drPqUXTZrqYZhCg4L0uCU0'

  
Feature: Reporting API Test Results to Digy Dashboard

Background:
  * def projectName = 'MyProject'
  * def buildId = 'Build_001'
  * def testSuiteName = 'API_Test_Suite'
  * def framework = 'KARATE'
  * def testType = 'API'
  * def tester = 'Pranjal Barot'
  * def apiType = 'REST'
  * def environment = 'QA'
  * def startTime = new java.util.Date().toString()
  * def executionMode = 'Automation'

Scenario: Successful API Request
  Given url 'https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod'
  And request { title: 'foo', body: 'bar', userId: 1 }
  When method POST
  Then status 201
  And match response contains { id: '#notnull' }
  * def endTime = new java.util.Date().toString()
  * def duration = karate.timeDiff(startTime, endTime)
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

Scenario: Failed API Request
  Given url 'https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod'
  When method GET
  Then status 404
  * def endTime = new java.util.Date().toString()
  * def duration = karate.timeDiff(startTime, endTime)
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
    "status": "FAIL",
    "duration": "#(duration)",
    "startTime": "#(startTime)",
    "endTime": "#(endTime)"
  }
  """
  * print 'Metadata:', metadata

Scenario: Request and Response Logging
  Given url 'https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod'
  When method GET
  Then status 200
  * def responseDetails = 
  """
  {
    "httpMethod": "GET",
    "url": "https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod",
    "requestHeaders": "#(karate.prevRequest.headers)",
    "responseHeaders": "#(karate.prevResponse.headers)",
    "responseBody": "#(response)",
    "httpStatus": "#(karate.prevResponse.status)"
  }
  """
  * print 'Request and Response Details:', responseDetails
