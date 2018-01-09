global with sharing class CustomWebServiceClass
{
     webservice static String createExpenseUsingSoap(String idParam, Decimal discount)
    {
      System.debug('incallout :'+idParam+' , discount'+discount);
      Expense__c exp=[select id, Expense_Name__c, name, Discount__c, Expense_Amount__c from Expense__c where id=:idParam];
      
        exp.name=exp.Expense_Name__c;
        exp.Expense_Amount__c=60000;
        exp.Discount__c=discount;
        update exp;
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
        mail.setSubject('Expense record updated : ' + exp.Id);
        
      
        mail.setPlainTextBody('Your Expense: ' + exp.Id +' has been changed.');
        
        mail.setHtmlBody('Your Expense:<b> ' + exp.Id +' </b>has been changed.<p>'+
             'To view your expense record <a href=https://ap5.salesforce.com/'+exp.Id+'>click here.</a>');
        
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                
        return str;
        
    }
}