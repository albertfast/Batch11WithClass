/*
public with sharing class HWReqRes {
    public static HttpResponse getUser() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://reqres.in/api/users');
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        System.debug('Resposnse Status '+ response.getStatus());
        System.debug('Resposnse Status Code '+ response.getStatusCode());
        System.debug('Resposnse Content/Body '+ response.getBody());

        if (response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            ParentWrapperClass pageInfos = (ParentWrapperClass) JSON.deserializeStrict(jsonString, ParentWrapperClass.class);
            Parent_Object__c pObj = new Parent_Object__c();
            pObj.Name = pageInfos.page;
            pObj.Per_Page__c = pageInfos.per_page;
            pObj.Url__c	= pageInfos.support.url;
            pObj.Description__c = pageInfos.support.text;

            insert pObj;

            list<Child_Object__c> childList = new list<Child_Object__c>();

            for (DataWrapperClass eachUser : pageInfos.data) {
                Child_Object__c cObj = new Child_Object__c();

                cObj.Email__c = eachUser.email;
                cObj.Avatar__c = '<img src=' +eachUser.avatar+'></img>';
                cObj.First_Name__c = eachUser.first_name;
                cObj.Last_Name__c = eachUser.last_name;
                cObj.Id__c = eachUser.id;
                cObj.Parent_Object__c = pObj.id;
        

                childList.add(cObj);

            }
            insert childList;
        }
        return response;


    }
    public class DataWrapperClass {
        public Integer id;
        public String email;
        public String first_name;
        public String last_name;
        public String avatar;
    }

    public class ParentWrapperClass {
        public List<dataWrapperClass> data;
        public String page;
        public Integer per_page;
        public Integer total_pages;
        public SupportWrapperClass Support;
    }

    public class SupportWrapperClass{
        public String Url;
        public String text;
    }

}  */

public with sharing class HWReqRes {

    public static HttpResponse getUser(){

        HttpRequest request = new HttpRequest();
        request.SetEndPoint('https://reqres.in/api/users');
        request.setMethod('GET');

        Http http = new Http();
        
        httpResponse response = http.send(request);

        system.debug(response.getstatus());
        system.debug(response.getBody());
        system.debug(response.getstatusCode());


        

        if(response.getstatuscode() == 200){

            string jsonstring = response.getBody();
            ParentWrapperClass pageInfos = (ParentWrapperClass) JSON.deserializeStrict(jsonString, ParentWrapperClass.class );

            Parent_Object__c pObj = new Parent_Object__c();

            pObj.name = pageInfos.page;
            pObj.Per_Page__c = pageInfos.per_page;
            pObj.Total__c = pageInfos.total;
            pObj.Total_Pages__c = pageInfos.total_pages;
            pObj.URL__c = pageInfos.support.url;
            pObj.Description__c = pageInfos.support.text;

            insert pObj;

            list<Child_Object__c> childList = new list<Child_Object__c>();

            for (DatasWrapperClass eachUser : pageInfos.data) {

                Child_Object__c cObj = new Child_Object__c();

                cObj.Email__c = eachuser.email;
                cObj.Avatar__c = '<img src=' +eachUser.avatar+'></img>';
                cObj.Name = eachUser.first_name;
                cObj.Id__c = eachUser.id;
                cObj.Last_Name__c = eachUser.last_name;
                cObj.Parent_Object__c = pObj.id;
                
                
                childList.add(cObj);           
                
            }
            insert childList;

        }
        return response;

    
    }

    public class ParentWrapperClass{

        public list<dataswrapperclass> data;
        public string page;
        public integer per_page;
        public integer total;
        public integer total_pages;
        public SupportWrapperClass support;

    

    }

    public class DatasWrapperClass{
        public string id;
        public string first_name;
        public string email;
        public string avatar;
        public string last_name;

        
    }
     public class SupportWrapperClass{
        public string url;
        public string text;
     }

    
}