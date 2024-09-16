#!/bin/bash

###########################################
# Script: USB Format Utility
# Author: Majik Cat Security
# Date: August 19, 2024
# Description: Simple USB format utility
###########################################

splash(){
figlet "USB Format" | lolcat
}

###############################

##########################   
#     CHECK FOR ROOT     #
##########################
if [ "$EUID" -ne 0 ]
        then echo "You must run as root or sudo to run the file"
        exit
fi

#===================================================================#
#			 CHECK FOR DEPENDENCIES AND INSTALL                     #
#===================================================================#
clear
splash
echo " "
echo -e "\e[35mINSTALLATION PROCESS...\e[0m"
echo " "
echo -e "\e[35mby Majik Cat Security\e[0m"
sleep 2
rm /usr/bin/usbform
chmod +x usbForm.sh
cp usbForm.sh /usr/bin/usbform
chmod +x /usr/bin/usbform
echo -e "\e[32mUSB Format is ready for use...\e[0m"
echo -e "\e[32mType usbform in terminal anywhere to start the application\e[0m"
sleep 3
clear
