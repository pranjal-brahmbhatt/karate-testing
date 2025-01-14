//import com.intuit.karate.junit5.Karate;
//import com.digy4.java.junit.Digy4JunitSupport;
//import org.junit.jupiter.api.AfterAll;
//import org.junit.jupiter.api.AfterEach;
//import org.junit.jupiter.api.BeforeAll;
//import java.net.URI;
//import java.net.http.HttpClient;
//import java.net.http.HttpRequest;
//import java.net.http.HttpResponse;
//import java.util.HashMap;
//import java.util.Map;
//import com.fasterxml.jackson.databind.ObjectMapper; // Import ObjectMapper for JSON conversion
//
//public class KarateTestRunner {
//
//    private static HttpClient httpClient; // Declare HttpClient at the class level
//
//    @BeforeAll
//    public static void setup() {
//        System.out.println("before start");
//
//        // Initialize the HttpClient once for the whole class
//        httpClient = HttpClient.newHttpClient();
//
//        // Record the start of the test run
//        Map<String, String> requestBody = new HashMap<>();
//        requestBody.put("status", "InProgress");
//        // sendPostRequest("https://2tvjoz1e36.execute-api.us-west-2.amazonaws.com/digy4-prod/v3/resultsSummary", requestBody);
//    }
//
//    @Karate.Test
//    Karate testApi() {
//        // Define which Karate feature file to run
//        System.out.println("testing");
//        Digy4JunitSupport.getWebDriver();
//        return Karate.run("classpath:examples/dashboard/dashboardtesting.feature").relativeTo(getClass());
//    }
//
//
//    @AfterEach
//    public void recordTestResult() {
//        // Record the result of the current test case
//        // Here you can dynamically capture the test name from Karate or JUnit if needed.
//        Map<String, String> testResult = new HashMap<>();
//        testResult.put("testCaseName", "ExampleTestCase"); // Dynamically set this from Karate/JUnit if needed
//        testResult.put("status", "Passed"); // Dynamically set the status based on test result
//        // sendPostRequest("https://2tvjoz1e36.execute-api.us-west-2.amazonaws.com/digy4-prod/v3/results", testResult);
//    }
//
//    @AfterAll
//    public static void tearDown() {
//        // Finalize test run and push results to DigyDashboard
//        System.out.println("end of test");
//
//        // Here you can dynamically calculate the counts
//        Map<String, Object> summary = new HashMap<>();
//        summary.put("status", "Completed");
//        summary.put("totalCount", 10);  // Replace with actual test count dynamically
//        summary.put("passedCount", 9); // Replace with actual passed count dynamically
//        summary.put("failedCount", 1); // Replace with actual failed count dynamically
//        // sendPostRequest("https://2tvjoz1e36.execute-api.us-west-2.amazonaws.com/digy4-prod/v3/resultsSummary", summary);
//    }
//
//    // Helper method to send HTTP POST requests
//    private static void sendPostRequest(String endpoint, Map<String, ?> body) {
//        try {
//            String baseUrl = "https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod"; //baseURL
//            URI uri = URI.create(baseUrl + endpoint);
//
//            // Convert the body Map to JSON
//            ObjectMapper objectMapper = new ObjectMapper();
//            String jsonBody = objectMapper.writeValueAsString(body);
//            System.out.println("JSON BOdy"+jsonBody);
//
//            // Create and send the HTTP POST request
//            HttpRequest request = HttpRequest.newBuilder()
//                    .uri(uri)
//                    .header("Content-Type", "application/json")
//                    .POST(HttpRequest.BodyPublishers.ofString(jsonBody))
//                    .build();
//
//            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
//            System.out.println("URI " + uri);
////             System.out.println("Response for " + endpoint + ": " + response.statusCode());
//        } catch (Exception e) {
////            e.printStackTrace();
//        }
//    }
//
//}
//
//
import com.intuit.karate.core.KarateParser;
import com.intuit.karate.core.ScenarioCall;
import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.junit5.Karate;
import com.digy4.java.junit.Digy4JunitSupport;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.TestInfo;
import org.junit.jupiter.api.extension.ExtendWith;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KarateTestRunner {

    private static HttpClient httpClient;
    private static int totalCount = 0;
    private static int passedCount = 0;
    private static int failedCount = 0;

    @BeforeAll
    public static void setup() {
        System.out.println("=== Test Run Started ===");

        // Initialize the HttpClient
        httpClient = HttpClient.newHttpClient();

        // Record the start of the test run
        Map<String, String> requestBody = new HashMap<>();
        requestBody.put("status", "InProgress");
//        sendPostRequest("/v3/resultsSummary", requestBody);
    }

    @Karate.Test
    Karate testApi() {
        System.out.println("=== Executing Test Cases ===");

        // Initialize WebDriver if needed
        Digy4JunitSupport.getWebDriver();

        // Execute the feature file
        return Karate.run("classpath:examples/dashboard/dashboardtesting.feature")
                .relativeTo(getClass());
    }


    @AfterAll
    public static void tearDown() {
        System.out.println("=== Test Run Completed ===");

        // Summarize the test results by reading from Karate's output JSON
        try {
            String resultFilePath = "target/karate-reports/karate-summary-json.txt"; // Adjust the file path if necessary

            // Read the JSON result file
            String jsonContent = new String(Files.readAllBytes(Paths.get(resultFilePath)));

            // Parse the JSON using ObjectMapper
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> result = objectMapper.readValue(jsonContent, Map.class);
            for (Map.Entry<String, Object> entry : result.entrySet()) {
                System.out.println(entry.getKey() + ": " + entry.getValue());
            }
            // Extract test results
            passedCount = (int) result.get("scenariosPassed");
            failedCount = (int) result.get("scenariosfailed");
            totalCount = passedCount + failedCount;
            // Output the results
            System.out.println("Total tests: " + totalCount);
            System.out.println("Passed tests: " + passedCount);
            System.out.println("Failed tests: " + failedCount);

            // Send the final summary to your endpoint
            Map<String, Object> summary = new HashMap<>();
            summary.put("status", "Completed");
            summary.put("totalCount", totalCount);
            summary.put("passedCount", passedCount);
            summary.put("failedCount", failedCount);
//            sendPostRequest("/v3/resultsSummary", summary);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void sendPostRequest(String endpoint, Map<String, ?> body) {
        try {
            // Define the base URL
            String baseUrl = "https://87z71f2mxj.execute-api.us-west-2.amazonaws.com/prod";
            URI uri = URI.create(baseUrl + endpoint);

            // Convert the body Map to JSON
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonBody = objectMapper.writeValueAsString(body);

            System.out.println("POST to: " + uri);
            System.out.println("Payload: " + jsonBody);

            // Create and send the HTTP POST request
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(uri)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonBody))
                    .build();

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("Response for " + endpoint + ": " + response.statusCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


