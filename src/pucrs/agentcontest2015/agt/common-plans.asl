+step(Step) 
<-
	//.print("** Step ",Step);
	!select_goal;
	.

+simEnd
	: roled(Role, Speed, LoadCap, BatteryCap, Tools)
<-
	!end_round;
	!new_round(Role, Speed, LoadCap, BatteryCap, Tools);
	.

+!new_round(Role, Speed, LoadCap, BatteryCap, Tools)
<-  .print("-------------------- BEGIN OF NEW ROUND ----------------");
	.
	
+!end_round
<-
	.print("-------------------- END OF THE ROUND ----------------");
	.abolish(_[source(self)]);
	.abolish(_[source(X)]);
    .drop_all_intentions;
    .drop_all_desires;	
	.
