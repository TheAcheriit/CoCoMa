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

//acheter item
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

//aller a un endroit
+!select_goal
	: location(Loc) &
	  not inFacility(Loc)
<- 
    !goto(Loc);
    print("Going to ",Loc)
    .

//production
+!select_goal
	: have_to_product(Type,Nb) &
	Nb > 0 &
	inFacility(workshop1) 
<-
	-have_to_product(Type,Nb);
	+have_to_product(Type,Nb-1);
	!assemble(Type);
	.print("assembling: ", Type).

	  
	
//production à plusieurs
+!select_goal
	: help(AgentId,Item,Nb) &
	Nb > 0
<-
	!assist_assemble(AgentId);
	-help(AgentId,Item,Nb);
	+help(AgentId,Item,Nb-1);
	.print("assembling: ", Item," with: ", AgentId)
	.

//delivrer job
+!select_goal
	: need(Item,Nb,S) &
	item(Item,Nb) &
	inFacility(S) &
	job(JobId)
<-
	!deliver_job(JobId).


// the last option: just skip the step			
+!select_goal <- !skip.