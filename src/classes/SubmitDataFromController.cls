public with sharing class SubmitDataFromController{

public static String firstName{get;set;}
public static String id{get;set;}

public void submit(){
   
     Account fol= new Account(Name=firstName,SLASerialNumber__c=id);
     insert fol; 
}
 

 
}