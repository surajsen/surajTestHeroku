public with Sharing class CallAccountManager
{
   @future(callout=true)
   public static void makeACall(String idParam, Decimal discount, String sessionId)
   {
     
     Http http=new Http();
     HttpRequest req=new HttpRequest();
     HttpResponse res=new HttpResponse();
     req.setEndPoint('https://ap5.salesforce.com/services/apexrest/CustomWebService/');
     req.setMethod('POST');
     
    System.debug('In future method');
     req.setBody('{"idParam":"'+idParam+'","discount":"'+discount+'"}');
     req.setHeader('Authorization', 'OAuth '+ sessionId);
     req.setHeader('Content-Type', 'application/json');
System.debug('in future method :'+idParam+' discount'+discount+',    session id  : '+ UserInfo.getSessionId());
     res=http.send(req);
     System.debug('Response returned  : '+res.getBody());   
   }
}