# blackboard-bin-1.1.3
by matthias.pueski@sick.de (Original  writer of this  software ) 

Please note if you wish to install this all  by hand then follow 
README_INSTALL.md

If  not then  please take note of the following below 


I have copied this across to  here  so that other can still use this  with other Linux distros 

The reasons for this are   as follows 


1: Its an excellent piece of software  that I don't want  to lose this 
2: Sadly  they no longer   distribute the  jar files  required to  compile this in relation to  the original  repository https://github.com/mpue/blackboard
3: You can  how ever still use the compiled  1.1.3  how ever 1.1.4 no longer works 
4: Ive  re written a script so that this runs on openSUSE 15.1  and 15.2  but the pre requisite is you must have  oracle java ver 8 installed 

To install  download the entire repository and then  change to the   location  where you this should be in your home folder  on your 
openSUSE installation 

Next run the installBB.sh  script  using ./installBB.sh


I also had to change the  Linux_Start.sh bash file  so that this would work 
Please also not this adds a desktop entry as well 


Details and code  of the installBB.sh are below   Enjoy !! 


MD Harrington 

https://www.facebook.com/mark.harrington.142892/


#!/bin/bash



# global  variables  


OS=$(uname -s)
VER=$(uname -r)
OSNAME=$(lsb_release -ic)




declare -a logpaths=("models" "symbols" "parts" "datasheets" "simulators")



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
echo "copying $i to ~./BlackBoard"
cp -R "$i" ~/.BlackBoard

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


