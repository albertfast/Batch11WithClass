public with sharing class AirlinesCallouts {
    public static HttpResponse getAirlineDetails() {
        //1. Prepare HttpRequest and wrap all the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');

        //2. Prepare Internet
        Http http = new Http();
        request.setTimeout(60000);
        //3. Send the request over the internet in order to receive response
        HttpResponse response = http.send(request);
        System.debug(response);
        System.debug(response.getBody());

        //4. process the response
        if (response.getStatusCode() == 200) {
           String jsonString = response.getBody();
           //Convert json string into sobject records
           List<AirlinesWrapper> wrappers = (List<AirlinesWrapper>)JSON.deserialize(jsonString, List<AirlinesWrapper>.class);

           List<Airlines__c> airlines = new List<Airlines__c>(); 
           for (AirlinesWrapper wrap : wrappers) {
            //Convert wrapper into sobject
            Airlines__c line = new Airlines__c();
            line.Name = wrap.name;
            line.Airlines_Id__c = wrap.id;
            line.Country__c = wrap.country;
            line.Established__c = wrap.established;
            line.Head_Quarters__c = wrap.head_quaters;
            line.Logo_URL__c = wrap.logo;
            line.Slogan__c = wrap.slogan;
            line.Website__c = wrap.website;
            airlines.add(line);
           }
           //Insert airlines records
           try {
            insert airlines;
           } catch (Exception ex) {
            //Create a log
            System.debug( 'WRONG! ' + ex.getMessage());
           }
        } if (response.getStatusCode() == 504){
            System.debug('BODY! ' + response.getBody());
            System.debug('STATUS! ' + response.getStatus());
        } else {
            System.debug('BODY! ' + response.getBody());
        }
        return response;
    }
}