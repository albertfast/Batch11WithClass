({
	doInit : function(component, event, helper) {
		var flow = component.find("flowData");
        
        //Set input values in a variable
        var inputVariables = [
        {
            name : "recordId",
            type : "String",
            value : component.get("v.recordId")
        }
            
        ];
        
        flow.startFlow("Screen_Flow_for_Aura", inputVariables);
	}
})