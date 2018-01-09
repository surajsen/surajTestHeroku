@RestResource(urlMapping='/CustomWebService/')
global with sharing class AccountManager
{
    @HttpPost
    global static String createExpense(String idParam,Decimal discount)
    {
      System.debug('incallout :'+idParam+' , discount'+discount);
      Expense__c expObj=[select id, Discount__c from Expense__c where id=:idParam];
        Expense__c exp=new Expense__c();
        exp.id=expObj.id;
        exp.Discount__c=discount;
        upsert exp;
        String str='Your discount amout is finalized to '+exp.discount__c;
            System.debug('incallout updation:'+exp);   
                // that will send out a single email to the addresses in the To, CC & BCC list.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {'suraj@aplitetech.com'}; 
        String[] ccAddresses = new String[] {'rahul.solanki@aplitetech.com'};
          
        
        // Assign the addresses for the To and CC lists to the mail object.
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        
        
        // Specify the name used as the display name.
        mail.setSenderDisplayName('Expense Support');
        
        // Specify the subject line for your email address.
        mail.setSubject('Expense record updated : ' + expObj.Id);
        
      
        mail.setPlainTextBody('Your Expense: ' + expObj.Id +' has been changed.');
        
        mail.setHtmlBody('Your Expense:<b> ' + expObj.Id +' </b>has been changed.<p>'+
             'To view your expense record <a href=https://ap5.salesforce.com/'+expObj.Id+'>click here.</a>');
        
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                
        return str;
        
    }
}