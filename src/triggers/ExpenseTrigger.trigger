trigger ExpenseTrigger on Expense__c (after insert, after update) 
{/*
  try{
       for(Expense__c exp:Trigger.new)
       { 
         String sessionId=UserInfo.getSessionId();
         System.debug('In Trigger:'+sessionId);
        
         if(exp.Expense_Amount__c>20000)
         {
          CallAccountManager.makeACall(exp.id, 4, sessionId);
         }
         if(exp.Expense_Amount__c>15000 && exp.Expense_Amount__c<20000)
         {
          CallAccountManager.makeACall(exp.id, 2.5, sessionId);
         }
         if(exp.Expense_Amount__c>10000 && exp.Expense_Amount__c <15000)
         {
          CallAccountManager.makeACall(exp.id, 2, sessionId);
         }
         if(exp.Expense_Amount__c<10000)
         {
          CallAccountManager.makeACall(exp.id, 1.5, sessionId);
         }
         System.debug('Trigger :'+exp);
       }
   }
   catch(exception ex){System.debug('Exception '+ex);}*/
}