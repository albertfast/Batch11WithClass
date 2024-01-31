
global without sharing class SpotifyIntegration {

    @AuraEnabled
    global static String generateResponseFromGPT(String queryText) {
        try {
            String content = generateResponse(queryText);
            return content;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    SpotifyToken__c settings = SpotifyToken__c.getOrgDefaults();
    global static String generateResponse(String queryText) {
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint('callout:SpotifyApp');
        httpReq.setMethod('PUT');
        httpReq.setHeader('Content-Type', 'application/json');
        httpReq.setHeader('Authorization', 'Bearer ' + settings.Token__c); // Replace with actual access token
        httpReq.setTimeout(60000); // Set timeout to 60 seconds (adjust as needed)

        // Construct the JSON payload
    String payload = '{"context_uri": "spotify:album:61Q6YpyhCqMwQDH9hpZfxO","offset": {"position": 5},"position_ms": 0}';

        // Set the payload for the PUT request
    httpReq.setBody(payload);

    Http http = new Http();
    HttpResponse httpResponse = http.send(httpReq);
    String content = '';
    if (httpResponse.getStatusCode() == 200) {
        System.debug(httpResponse.getBody());
        // Process the response if needed
    } else {
        System.debug('Error !!');
        System.debug(httpResponse.getBody());
    }
    return content;
    }

    global class SpotifyResponseWrapper {
        public SpotifyTrackWrapper tracks;
    }

    global class SpotifyTrackWrapper {
        public Integer total;
        public SpotifyTrackItem[] items;
    }

    global class SpotifyTrackItem {
        public SpotifyTrack track;
    }

    global class SpotifyTrack {
        public String name;
        // Add other properties as needed
    }
}

/*
global static String generateResponse(String queryText) {
    HttpRequest httpReq = new HttpRequest();
    httpReq.setEndpoint('https://api.spotify.com/v1/me/player/play');
    httpReq.setMethod('PUT');
    httpReq.setHeader('Content-Type', 'application/json');
    httpReq.setHeader('Authorization', 'Bearer BQCtzmzMsSoGP_lcUcHAUo2LVPwEllp0JimMwCe15JdTl8Qxmk4_0rgjteG2Yi7AMAI4klSpYTHEUkY6Dt0QfUFAebxnGWRC32QiPsoBmo_bVO4FKs50Ovg4SNlSpOfo--MJhMS-ymdgLHAwNEw1QirHmjDXIwYnudAql_p_d-5bootOE0bfbwOWy3ik5l1RtG7kAuvxETcj3WiNq80rLFlza8SCv51t-2SJJNGAAgn93ES_gliqaWGyofBqBgZog9qsMugIa0ejeVXm4g'); // Replace with actual access token
    httpReq.setTimeout(60000); // Set timeout to 60 seconds (adjust as needed)

    // Construct the JSON payload
    String payload = '{"context_uri": "spotify:album:5ht7ItJgpBH7W6vJ5BqpPr","offset": {"position": 5},"position_ms": 0}';

    // Set the payload for the PUT request
    httpReq.setBody(payload);

    Http http = new Http();
    HttpResponse httpResponse = http.send(httpReq);
    String content = '';
    if (httpResponse.getStatusCode() == 200) {
        System.debug(httpResponse.getBody());
        // Process the response if needed
    } else {
        System.debug('Error !!');
        System.debug(httpResponse.getBody());
    }
    return content;
}
*/