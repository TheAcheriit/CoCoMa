// if I am going to some place.... continue 
+!select_goal 
	: going(Facility) 
<-
	//.print("Continuing to location ",Facility); 
	!continue;
	.		

// if I am in a facility that sells a tool for my role that I still do not have, buy it
+!select_goal
	: required_tool(Tool) &
	  find_shop(Tool,Facility) &
	  inFacility(Facility)
<-
	.print("Buying tool: ",Tool);
	!buy(Tool,1);
	.

// if my role is assigned to a tool and I am not going anywhere
// then go to a shop where I can buy the tool  
+!select_goal
	: required_tool(Tool) &
	  find_shop(Tool,Shop)
<-
	.print("Going to shop: ",Shop," to buy tool: ",Tool);
	!goto(Shop);
	.

// the last option: just skip the step			
+!select_goal <- !skip.