/**
 * Error: Methods defined as TestMethod do not support Outbound Integration/Web service callouts
 * Covering Rest Callout Test Scenario can be done using 2 Approaches:
 * 1. Static Resource Callout Mock
 * 2. Creating a Mock Response using HttpCallout class
 */
@IsTest
public with sharing class RestApiOutboundCallout_Test {

    /**
     * Unit Test Success Response for Animal Heroku App - GET Method
     * STATIC RESOURCE MOCK APPROACH
     * Step 1: Upload Response Body as a Static Resource
     * Step 2: Fetching Mock Response from Static Resource
     * Step 3: Link/Assosiate the Mock Response to our Unit Test context
     * Step 4: Invoking REST merthod logic
     * Step 5: Assertion Stateements
     */
    @IsTest
    public static void getAnimalsSuccessTestUsingStaticResource(){
        // Create a mock Response based on our Static Resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setStatus('OK');
        mock.setHeader('Content-Type', 'application/json');

        // Assosiate the Callout with this Mock Response
        Test.setMock(HttpCalloutMock.class, mock);

        // Invoking Apex logic
        Test.startTest();
        HttpResponse mockResponse = RestApiOutboundCallout.getAnimals();
        Test.stopTest();

        // Assertion Statements
        System.assertEquals(200, mockResponse.getStatusCode(), 'Success Response should be 200');
        System.assertNotEquals(null, mockResponse.getBody(), 'Mock Response content should give something');

    }

    /**
     * Unit Test Success Response Scenario for Get User callout - GET Method
     * HTTP CALLOUT MOCK RESPONSE
     * Step 1: Create a new Apex Class implementing HttpCalloutMock
     * Step 2: Inside this class we try to create HttpResponse Object
     * Step 3: Assosiate Mock Reponse to our Unit Test method
     * Step 4: Invoking REST Callout
     * Step 5: System Assertion
     */
    @IsTest
    public static void getUserSuccessTestUsingCalloutMock(){
        // Set Callout Mock Response
        Test.setMock(HttpCalloutMock.class, new GetUserCalloutMockResponse());

        // Rest Callout in test context
        Test.startTest();
        HttpResponse mockResponse = RestApiOutboundCallout.getUser();
        Test.stopTest();

        // Assertion statements
        System.assertEquals(200, mockResponse.getStatusCode(), 'Success Response should be 200');
        System.assertNotEquals(null, mockResponse.getBody(), 'Mock Response content should give something');
    }

    // Create Mock Response Class
    public class GetUserCalloutMockResponse implements HttpCalloutMock {
        // Implement respond Interface method
        public HttpResponse respond(HttpRequest request){
            // Create a fake Response
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}');
            return response;
        }
    }

    public class getListOfUsersCalloutMockResponse implements HttpCalloutMock{
        public HttpResponse respond(HttpRequest request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            response.setHeader('Content-Type', 'application/json');
            response.setBody('[{ "id": 356207,"name": "Miss Dharani Banerjee","email": "dharani_miss_banerjee@bergnaum-osinski.com","gender": "male","status": "active"}]');
            return response;
        }
    }
    @isTest
    private static void getListOfUsersTest(){
        getListOfUsersCalloutMockResponse mock2 = new getListOfUsersCalloutMockResponse();
        Test.setMock(HttpCalloutMock.class, mock2);
        HttpResponse response = RestApiOutboundCallout.getListOfUsers();
        system.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }

    public class postAnimalCalloutMockResponse implements HttpCalloutMock{
        public HttpResponse respond(HttpRequest Request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(201);
            response.setHeader('Content-Type', 'application/json');
            request.setBody('{ "name" : "fluffy bunny" }');
            return response;
        }
    }
    @isTest
    private static void postAnimalTest(){
        postAnimalCalloutMockResponse mock2 = new postAnimalCalloutMockResponse();
        Test.setMock(HttpCalloutMock.class, mock2);
        HttpResponse response = RestApiOutboundCallout.postAnimal();
        system.assertEquals(201, response.getStatusCode());
      
    }
    public class postUserCalloutMockResponse implements HttpCalloutMock{
        public HttpResponse respond(HttpRequest Request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(201);
            response.setHeader('Content-Type', 'application/json');
            request.setBody('{"id": 1,"email": "george.bluth@reqres.in","first_name": "George","last_name": "Bluth","avatar": "https://reqres.in/img/faces/1-image.jpg"}');
            return response;
        }
    }
    @isTest
    private static void postUserTest(){
        postUserCalloutMockResponse mock2 = new postUserCalloutMockResponse();
        Test.setMock(HttpCalloutMock.class, mock2);
        HttpResponse response = RestApiOutboundCallout.postUser();
        system.assertEquals(201, response.getStatusCode());
      
    }

    public class getAnimalWithAuthenticationNamedCredentialCalloutMockResponse implements HttpCalloutMock{
        public HttpResponse respond(HttpRequest Request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setHeader('Content-Type', 'application/json');
            request.setBody('{"trailhead": "is awesome."}');
            return response;
        }
    }
    @isTest
    private static void getAnimalWithAuthenticationNamedCredentialTest(){
        getAnimalWithAuthenticationNamedCredentialCalloutMockResponse mock2 = new getAnimalWithAuthenticationNamedCredentialCalloutMockResponse();
        Test.setMock(HttpCalloutMock.class, mock2);
        HttpResponse response = RestApiOutboundCallout.postUser();
        system.assertEquals(200, response.getStatusCode());
      
    }

}