public with sharing class SoapApiOutoundCallloutParkMock implements WebServiceMock {
    public void doInvoke(
        Object stub, 
        Object request, 
        Map<String,Object> response, 
        String endpoint, 
        String soapAction, 
        String requestName,
        String responseNS, 
        String responseName, 
        String responseType
    ){
        ParkSOAPApex.byCountryResponse response_x = new ParkSOAPApex.byCountryResponse();
        List<String> parkNames = new List<String>{'Park1','Park2','Park3'};
        response_x.return_x = parkNames;
        // response_x.return_x= new List<String>{'Park1','Park2','Park3'};

        response.put('response_x', response_x);
    }
}