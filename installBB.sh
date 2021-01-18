#!/bin/bash

# MD Harrington https://www.facebook.com/mark.harrington.142892/

# global  variables  


OS=$(uname -s)
VER=$(uname -r)
OSNAME=$(lsb_release -ic)

installpath=~/.BlackBoard


declare -a logpaths=("symbols/ " "parts/ " "datasheets/ " "simulators/ " "models/ ")



# clear and pause   for a second

function cls {
echo -e '\0033\0143'
sleep 3	
}

function startupFile {
echo "#!/bin/bash" | tee  Linux_Start.sh 
echo  "cd /home/$USER/blackboard-bin-1.1.3" | tee -a Linux_Start.sh 
 
echo "java -Dsun.java2d.opengl=true -jar BlackBoard.jar" | tee -a Linux_Start.sh 

chmod +x Linux_Start.sh 

}


function createDesktopEntry {
	
	
	echo "[Desktop Entry]" | tee  BBDesigner.desktop
	echo "Type= Application" | tee -a BBDesigner.desktop
	echo "Exec=/home/$USER/blackboard-bin-1.1.3/Linux_Start.sh " | tee -a BBDesigner.desktop
	echo "Categories=Application;Development" | tee -a BBDesigner.desktop
	echo "Comment= java 8  blackboard strip designer" | tee -a BBDesigner.desktop
	echo "Name= BB Designer" | tee -a BBDesigner.desktop
	echo "Icon=/home/$USER/blackboard-bin-1.1.3/icons/bb_dark.png" | tee -a BBDesigner.desktop
	echo "StartupNotify=true" | tee -a BBDesigner.desktop
	echo "Terminal=false "  | tee -a BBDesigner.desktop
	
	echo "Desktop entry created " 
	echo 
	
	chmod +x BBDesigner.desktop
	
}


function myinstall {
echo "Creating folders forblackboard and copying files"


for i in "${logpaths[@]}"
do 
echo
echo "copying $i to ~/.BlackBoard"
cp -R $i ~/.BlackBoard 

done 

# have to do this twice  Why I dont know  but seems to solve the problem 
for i in "${logpaths[@]}"
do 
echo
echo "copying $i to ~/.BlackBoard"
cp -R $i ~/.BlackBoard 

done 




# modify start up file 
echo
echo  "Creating startup file " 
# call  function 
startupFile


# create a desktop entry 

echo
echo "Creating desktop entry for BlackBoard Strip designer "
createDesktopEntry

echo 
echo 
cp BBDesigner.desktop /home/$USER/Desktop/BBDesigner.desktop
rm BBDesigner.desktop

}
# end function 

if [[ $OSNAME =~ .*openSUSE.* ]]; then
echo "Script is correct for $OSNAME ver 15.1 ver 15.2." 
else 
	echo "Execute script at  your own  risk This is meant for openSuse Ver15.1 , 15.2 "
	 
fi  

echo "Do you wish to install this program? select 1 for yes or 2 for no "
select yn in "Yes" "No"; do
    case $yn in
        Yes ) myinstall; break;;
        No ) exit;;
    esac
done



echo "You can now use blackbourd designer MD Harrington " 



