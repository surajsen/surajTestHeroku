({
	doInit : function(component, event, helper) {
    debugger; console.log('handler');
	var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Expense__c"
    });
    createRecordEvent.fire();
	}
})