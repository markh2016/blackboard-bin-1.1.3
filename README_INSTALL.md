#BlackBoard Circuit Designer

Blackboard is intended for the hobby enthusiast and should help building prototypes on so called breadboards easily.

Currently BlackBoard provides the following features:

* Create so called breadboards (also stripe or perf boards) easily
* Create simple and easy to read schematics
* NGSpice integration, thus the ability to simulate the current schematic with NGSpice
* A big library of electronic parts with more than 400 pieces and library with 500 symbols 
* integrated part and symbol editor
* layer based editing

**Important:**

All data is now stored and retrieved from users home directory. Users which use nigthly builds 
or the sources must copy the directories symbols, models, parts, datasheets and simulators 
to the folder USER_HOME/.BlackBoard 
 
For further information visit the [homepage] (http://pueski.de)

## Installing under Unixoides (Linux, BSD, MacOS)

	Fisrt of all unzip the archive

	then copy the needed files
	
    $ cp -R models/ ~/.BlackBoard
    $ cp -R symbols/ ~/.BlackBoard
	$ cp -R samples/ ~/.BlackBoard
    $ cp -R parts/ ~/.BlackBoard
    $ cp -R datasheets/ ~/.BlackBoard
    $ cp -R simulators/ ~/.BlackBoard

## Running

    $ java -Dsun.java2d.opengl=true -jar dist/lib/BlackBoard.jar
