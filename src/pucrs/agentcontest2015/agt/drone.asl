// specific plans for drones

// the drone will coordinate the agents for the priced job
// (hard coded coordination)

+pricedJob(JobId,Storage,Begin,End,Reward,Items)
   : not .desire( commit_to_job(_,_) ) // to avoid committing to two jobs 
<- !commit_to_job(JobId,Items).



+!commit_to_job(JobId,Items) :
	pricedJob(JobId,Storage,Begin,End,Reward,Items)
<- .print("Going for a job, items=",Items);
	.broadcast(tell,job(JobId));
   for(.member(item(Type,Nb),Items)){
    	+need(Type,Nb,Storage);
   }
   .
    


+need(material3,Nb,Storage)
<- +need(material1,Nb*2, none);
	.broadcast(tell,need(material3,Nb,Storage));
	+location(workshop1).

+need(material1, Nb, Storage) :
	Nb > 1
<- 
	.send(vehicle3,tell,need(material1,Nb,Storage))   
	.
	
	
+need(material1,1,_):
	not item(base1,_)
<-
	+required_item(base1,5)
	.
	
+need(material1,1,_):
	item(base1,Nb2) &
	5 > Nb2
<-
	+required_item(base1,5-Nb2)
	.

+item(base1, Nb):
	need(material1,1,_) &
	Nb >= 5 &
	item(tool1,1)
<-
	+location(workshop1)
    .

+location(worshop1):
	inFacility(workshop1) &
	need(material1,1,_) &
	item(base1,Nb) &
	Nb >= 5 &
	item(tool1,1) &
	inFacility(workshop1)
<-
    +have_to_product(material1,1)
    .