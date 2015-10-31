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

+!select_goal
	: required_item(Item,Nb) &
	  find_shop(Item,Shop) &
	  inFacility(Facility)
<-
	.print("Buying item: ",Item);
	!buy(Item,Nb);
	-required_item(Item,Nb)
	.
	
+!select_goal
	: required_item(Item,Nb) &
	  find_shop(Item,Shop)
<-
	.print("Going to shop: ",Shop," to buy item: ",Item);
	!goto(Shop);
	.
	

	
+!select_goal
	: location(Loc)
<- 
!goto(Loc);
-location(Loc);
print("Going to ",Loc).

+!select_goal
	: have_to_product(Type,Nb) &
	Nb > 0
<-
	-have_to_product(Type,Nb);
	+have_to_product(Type,Nb-1);
	!assemble(Type);
	.print("assembling: ", Type).

// the last option: just skip the step			
+!select_goal <- !skip.