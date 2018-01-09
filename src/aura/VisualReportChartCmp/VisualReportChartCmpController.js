({
      createChart : function (component, event, helper) {
        var chartCanvas = component.find("chart").getElement();
        var typeofchart = component.get("v.Charttype");
        debugger;
        var action = component.get("c.getReport");
       action.setParam("recordId",component.get("v.recordId"));
        action.setCallback(this, function(response) {
          var state = response.getState();
            if (state === "SUCCESS") {
                debugger;
                var reportResultData = JSON.parse(response.getReturnValue());
                console.log(reportResultData);
                var chartData = [];
                var chartLabels = [];
               var rName = component.get("v.recordName");
                
                component.set("v.recordName", reportResultData.reportMetadata.name);
                if(reportResultData.groupingsDown.groupings){
                    
                     for(var i=0; i < (reportResultData.groupingsDown.groupings.length); i++){
                    //Collect all labels for Chart.js data
                    var labelTemp = reportResultData.groupingsDown.groupings[i].label;
                    chartLabels.push(labelTemp);

                    var keyTemp = reportResultData.groupingsDown.groupings[i].key;

                    //Collect all values for Chart.js data
                    var valueTemp = reportResultData.factMap[keyTemp + '!T'].aggregates[0].value ;
                    chartData.push(valueTemp);
                }
                }
               
                //Construct chart
                var chart = new Chart(chartCanvas,{
                    type: typeofchart,
                    data: {
                        labels: chartLabels,
                        datasets: [
                            {
                                label: "test",
                                data: chartData,
                                
                                fillColor : "Blue",
                                fill: true,
                    			pointBackgroundColor: "#4c92c5",
                				pointBorderWidth: 10,
                				pointHoverRadius: 10,
                				pointRadius: 10,
                				bezierCurve: true,
                				pointHitRadius: 10,
                                backgroundColor: "#0000FF",
    							borderColor: "#0000FF"
                            }
                        ]
                    },
                    options: {
                        legend: {
                   			 position: 'bottom',
                    		 padding: 1,
                			 scales: {
            					yAxes: [{
            					ticks: {
               			 		beginAtZero:true,
                         		min: 0,   
            					}		
       					 		}]
    					}
                },
                        maintainAspectRatio : true,
                        responsive : true
            }
                });
                
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                  /*  if (errors[0] && errors[0].message) {
                        console.log("Error message on createReport: " +
                                    errors[0].message);
                    }
                    */
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    reportName : function (component, event, helper) {
        
        
    } 
})