//------Class----------//

public class leanChartReportController {
    @AuraEnabled
    public static String ReportName{get;set;}
    
@auraEnabled
public static String getReport(String recordId){
    //Using report id for example purpose
    Report reportRec = [SELECT Id,Name FROM Report WHERE Id = :recordId limit 1];
	ReportName = reportRec.Name;
    Reports.ReportResults reportResult = Reports.ReportManager.runReport(reportRec.Id, true);
    return JSON.serialize(reportResult);
}
}