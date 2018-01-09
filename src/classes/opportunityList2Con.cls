public class opportunityList2Con {

    public Boolean collaps { get; set; }

    
    public PageReference next() {
    if(!setCon.getHasNext())
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'No more records available'));
        }
        setCon.next();
        
        return null;
    }
    public PageReference prev() {
    if(!setCon.getHasPrevious())
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'No more records available'));
        }
        setCon.previous();
        return null;
    }

    // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCon {
        get {
        
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, CloseDate FROM Opportunity]));
                    setCon.setPageSize(6);
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Opportunity> getOpportunities() {
        
        return (List<Opportunity>) setCon.getRecords();
    }
}