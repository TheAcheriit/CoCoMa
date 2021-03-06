# mas-pc-pucrs-2015
This project is a base team written in JaCaMo to participate in the
Multi-agent Programming Contest 2015

https://multiagentcontest.org

It is based on the PUCRS team :

Rafael C. Cardoso
Anibal S. Heinsfeld
Alison R. Panisson
Ramon F. Pereira
Mauricio Magnaguagno
Artur Freitas
Felipe Meneguzzi
Rafael H. Bordini

----

Follow the steps below to run it:

- import this folder as a java project in Eclipse, (option import existing project)
- in eclipse, open src/util/StartServer.java and execute it
- in eclipse, open src/util/StartTeams.java and execute it
- in the eclipse console, select the StartServer console and press ENTER to start the simulation
- optionally, open and run src/util/StartMonitor.java

It is also possible to run the simulation using the Ant script (file build.xml), 
optionally using one terminal for each processes:

- ant server: to start the server
- ant java-team: to start the java team
- ant jcm-team
- ant monitor

----

Documentation:

- scenario description: doc/scenario.pdf
- available actions and perception: doc/eismassim.pdf
- slides: doc/slides-mapc-2015.pdf

To understand the JaCaMo team:

- scenario1.jcm: the agents of the project
- vehicle.asl: the main source code for the agents (see comments in the file)
- common-plans.asl: the main plans (to start deciding a what to do in a step)
- common-select-goal.asl: select the action for the current situation
