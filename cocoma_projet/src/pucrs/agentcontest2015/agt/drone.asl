// specific plans for drones

// the drone will coordinate the agents for the priced job
// (hard coded coordination)

+pricedJob(JobId,Storage,Begin,End,Reward,Items)
   : not .desire( commit_to_job(_,_) ) // to avoid committing to two jobs 
<- !commit_to_job(JobId,Items).

+!commit_to_job(JobId,Items) 
<- .print("Going for a job, items=",Items);
   .wait({+forever}); // forever, so that the intention remains
   .
   
   