// specific plans for motorcycles

+need(material1,Nb):
	not item(base1,_) &
	Nb < 5
	<-
	+required_item(base1,Nb*5)
	.
	
+need(material1,Nb):
	item(base1,Nb2) &
	Nb < 5 &
	5 * Nb > Nb2
	<-
	+required_item(base1,5*Nb-Nb2)
	.

+item(base1,Nb) :
	need(material1,Nb2) &
	item(tool1,1) &
	Nb2 < Nb*5 &
	not inFacility(workshop1)
	<-
	+location(workshop1)
.

+inFacility(workshop1) :
	need(material1,Nb) &
	item(base1,Nb2) &
	item(tool1,1) &
	Nb2 >= Nb*5 
<-
+have_to_product(material1,Nb);
.

