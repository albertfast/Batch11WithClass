
global without sharing class SpotifyIntegration {

    static SpotifyToken__c setting;
  
    static {
      setting = SpotifyToken__c.getOrgDefaults();
    }

    @AuraEnabled
    global static String generateResponseFromGPT(String queryText) {
        try {
            String content = generateResponse(queryText);
            return content;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
    global static String generateResponse(String queryText) {
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint('callout:SpotifyApp');
        httpReq.setMethod('PUT');
        httpReq.setHeader('Content-Type', 'application/json');
        httpReq.setHeader('Authorization', 'Bearer ' + setting.Authorization__c); // Replace with actual access token
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

