global class dashboardPageController {
    public String baseURL{get; set;}
    public dashboardPageController()
    {
        baseURL=URL.getSalesforceBaseUrl().toExternalForm()+'/';
        
    }
}