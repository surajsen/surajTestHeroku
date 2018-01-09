public class actocons
{

   

    public boolean showHide { get; set; }
    public list<account> acct{set;get;}
    public actocons()
    {
        acct=[select id,name,(select id,lastname,email from contacts)from account limit 10];
        showHide=true;
    }
    public void myCall()
    {
       showHide=true;
    }
     public void refresh() {
       
        if(acct.size()>0)
        {
          showHide=false;
        }
       
        
    }

   
}