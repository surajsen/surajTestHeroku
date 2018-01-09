public class HideTabClass
{
 public list<Expense__c> expenses{set;get;}
    public HideTabClass()
    {
        expenses=[select id,name, Expense_Amount__c, Discount__c from Expense__c];
        expenses=new List<expense__c>();
    }
}