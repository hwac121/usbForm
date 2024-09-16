#!/bin/bash

###########################################
# Script: USB Format Utility
# Author: Majik Cat Security
# Date: August 19, 2024
# Description: Simple USB format utility
###########################################

Splash(){
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

##########################
#    CLEAR THE SCREEN    #
##########################

clear

##########################
#     SELECTION MENU     #
########################## 

options=("Check Drives" "Enter usb path (ie /dev/sdb)" "Unmount USB" "Format to FAT32" "Format to NTSF" "Format to exFAT" "Format to UDF" "Check File System" "Quit")

PS3="Choose the action to take or 9 to Quit: "

while [ "$menu" != 1 ]; do
clear
Splash
echo " "
        select opt in "${options[@]}"; do
        case $opt in 
		"Check Drives")
			clear
			Splash
			echo " "
			echo "Checking drive location..."
			sleep 1
			df
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 10 seconds...\e[0m"
			sleep 10
			clear
		break
		;;

		"Enter usb path (ie /dev/sdb)")
			clear
			Splash
			echo " "
			echo "type the usb path here"
			read UsbPath
			echo "You entered $UsbPath"
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Unmount USB")
			clear
			Splash
			echo " "
			echo "unmounting $UsbPath"
			umount $UsbPath
			sleep 1
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Format to FAT32")
			clear
			Splash
			echo " "
			echo "Formating $UsbPath in FAT32 file system"
			sleep 1
			mkfs.vfat $UsbPath
			sleep 3
			echo "Format operation is complete!"
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Format to NTFS")
			clear
			Splash
			echo " "
			echo "Formating $UsbPath in NTFS file system"
			sleep 1
			mkfs.ntfs $UsbPath
			sleep 3
			echo "Format operation is complete!"
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Format to exFAT")
			clear
			Splash
			echo " "
			echo "Formating $UsbPath to exFAT file system"
			sleep 1
			mkfs.exfat $UsbPath
			sleep 3
			echo "Format operation is complete!"
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Format to UDF")
			clear
			Splash
			echo " "
			echo "Formating $UsbPath to UDF file system"
			sleep 1
			mkfs.udf
			sleep 3
			echo "Format operation is complete!"
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Check File System")
			clear
			Splash
			echo " "
			echo "Checking file system integrity"
			sleep 1
			fsck $UsbPath
			echo " "
			echo -e "\e[36mNOTE:\e[0m \e[7mYou will return to the main menu in 3 seconds...\e[0m"
			sleep 3
			clear
		break
		;;
		"Quit")
			clear
			Splash
			echo -e " "
			echo -e "USB Format by hwac121 - 2024"
			menu=1
			sleep 3
			clear
                break
                ;;
        * )
			clear
			Splash
			echo " "
			echo -e "$REPLY is an invalid option"
			sleep 3
			clear
                break
                ;;
        esac
        done
done

