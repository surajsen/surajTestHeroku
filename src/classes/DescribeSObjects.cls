public with sharing class DescribeSObjects 
{

    public List<Schema.SObjectType> sObjectList { get; set; }
    public DescribeSObjects()
    {
       sObjectList= Schema.getGlobalDescribe().Values();
    }
    
}