({
	invoke : function(component, event, helper) {
		
        //Get the record Id Attribute
        var record = component.get("v.recordId");
        
        //Get the Lightning Event that opens a record in a new tab
        var redirect = $A.get("e.force:navigateToSObject");
        
        //Pass the record id to the event
        redirect.setParams({
            "recordId" : record
        });
        
        //Opens the record
        redirect.fire();    
	}
})