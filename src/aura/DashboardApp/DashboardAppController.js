({
 doInit : function(component, event, helper) {
     alert('doInit');
     alert(window.location.pathname);
      //window.top.parent.location.href="https://risingsun-dev-ed.lightning.force.com/one/one.app#/sObject/01Z7F000000gpGVUAY/view";
    //var address = component.find("address").get("v.value");

      /*var urlEvent = $A.get("e.force:navigateToURL");
      urlEvent.setParams({
          "url": 'https://rahulsolanki73-dev-ed.my.salesforce.com/01Z7F000000Q3hN'});
       urlEvent.fire();
     debugger.consol();*/
    /*var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": "01Z7F000000gpGVUAY",
      "slideDevName": "related"
    });
    navEvt.fire();*/
    }
})