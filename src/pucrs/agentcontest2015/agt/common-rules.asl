
// unifies tools the agent is able (by its role), but does not have
required_tool(T) :-
   role(_,_,_,_,Tools) & 
   .member(T,Tools) &
   not item(T,_).

find_shop(ItemId, ShopId) :-
	shop(ShopId,_,_,Items) &
	.member(item(ItemId,Price,Amount,_), Items).

location(L):- need(Item, Nb, L) &
			  item(Item,Nb2) &
			  Nb2>Nb &
			  not inFacility(L).
	
+have_to_product(Type,0)
<-
-have_to_product(Type,0).

+help_me(Item,Nb)[source(AgentId)]
<-
-help_me(Item,Nb)[source(AgentId)];
+help(AgentId,Item,Nb).

+help(AgentId,Item,0)
<-
-help(AgentId,Item,0).