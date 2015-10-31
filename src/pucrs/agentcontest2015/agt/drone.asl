// specific plans for drones

// the drone will coordinate the agents for the priced job
// (hard coded coordination)

+pricedJob(JobId,Storage,Begin,End,Reward,Items)
   : not .desire( commit_to_job(_,_) ) // to avoid committing to two jobs 
<- !commit_to_job(JobId,Items).

+!commit_to_job(JobId,Items) 
<- .print("Going for a job, items=",Items);
   for(.member(item(Type,Nb),Items)){
   	+need(Type,Nb);
   }
   .
   
/* +need(Type, Nb)
	: product(Type,_,Liste) &
	not Liste == []
<-
	for(.member(consumed(Type1,Nb1),Liste)){
		+need(Type1,Nb1*Nb);
	}
	for(.member(tools(Type2,Nb2),Liste)){
		+need(Type2,Nb2);
	}
	.*/

+item(Type, Nb)
	: need(Type, Nb2) &
	Nb == Nb2
<-
	-need(Type,Nb2)
	.
	
+item(Type, Nb)
	: need(Type, Nb2) &
	Nb < Nb2
<-
	-need(Type,Nb2);
	+need(Type,Nb2-Nb)
	.

+need(material3,Nb)
<- +need(material1,Nb*2).
		
+need(material1,Nb):
	not item(base1,_)
	<-
	+required_item(base1,Nb*5)
	.
	
+need(material1,Nb):
	item(base1,Nb2) &
	Nb*5 > Nb2
	<-
	+required_item(base1,Nb*5-Nb2)
	.

+need(material1,Nb):
	item(base1,Nb*5) &
	item(tool1,1)
	<-
	+location(workshop1)

.

+need(material1,Nb):
	item(base1,Nb*5) &
	item(tool1,1) &
	inFacility(workshop1)
<-
+have_to_product(material1,Nb)

.