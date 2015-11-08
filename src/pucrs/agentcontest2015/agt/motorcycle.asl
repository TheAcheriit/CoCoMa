// specific plans for motorcycles

required_item(base1,8):- 
	not item(tool3, 1) &
	not item(base1, Nb) &
	Nb >= 8.
	
have_to_product(tool3,1) :- not item(tool3,1).

	
+need(material1,Nb,_)
<-
	+required_item(base1,Nb*5)
	.

+item(base1,Nb) :
	need(material1,Nb2,_) &
	item(tool1,1) &
	Nb2 < Nb*5 &
	not inFacility(workshop1)
<-
	+location(workshop1)
    .

have_to_product(material1,Nb) :-
	inFacility(workshop1) &
	need(material1,Nb,_) &
	item(base1,Nb2) &
	item(tool1,1) &
	Nb2 >= Nb*5 
    .

