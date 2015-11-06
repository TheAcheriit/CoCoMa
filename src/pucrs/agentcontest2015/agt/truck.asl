// specific plans for trucks


//si material 3 vas chercher les trucs lourds
+need(material3,Nb)
<-
	+required_item(base3,Nb);
	+required_item(base2,Nb*2).
	
	
+item(base3,Nb):
	need(material3,Nb) &
	item(base2, Nb*2)
<-
	+location(workshop1).
	
+item(base2,Nb):
	need(material3,Nb/2) &
	item(base3, Nb/2)
<-
	+location(workshop1).
	
	
+arrived(workshop1):
	need(material3, Nb)
<-
	.send("vehicle3",tell,help_me(material3,Nb));
	+have_to_product(material3,Nb)
.