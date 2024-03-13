@RestResource(urlMapping='/schoolInfo/*')
global class SchoolInformationService {
    global class SchoolInfo {
      String schoolId{get;set;}
      String schoolName{get;set;}
      String schoolAddress{get;set;}
      String schoolPhone{get;set;}
      String schoolemail{get;set;}
      Decimal schoolfees{get;set;}
      
    }

  @httpGet
  global static SchoolInfo getSchool()
  {
      RestRequest request=RestContext.Request;
        String schoolId= request.requestURI.substring(request.RequestURI.lastIndexOf('/')+1);
         school__c school=[select id,Name,School_Address__c,School_Name__c,School_Phone__c,Fees__c,School_Email__c from School__c where id=:schoolId];
         SchoolInfo schInfo=new SchoolInfo();
         schInfo.schoolId = school.id;
         schInfo.schoolName=school.Name;
         schInfo.schoolAddress=school.School_Address__c;
         schInfo.schoolPhone=school.School_Phone__c;
         schInfo.schoolfees=school.Fees__c;
         schInfo.schoolemail=school.School_Email__c;
         return schInfo;
  }
         
        
  }

