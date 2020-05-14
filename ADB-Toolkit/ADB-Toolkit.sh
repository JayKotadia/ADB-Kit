#!/bin/bash
#Tool = ADB-Toolkit V2.1
#Author = AnonUser
#Date = 07/02/2020
#Written in Bash
#"ONLY FOR EDUCATIONAL PURPOSE"

current_version=2.32

echo -e "ADB-Toolkit by AnonUser\n\n"

#echo -e "Checking for New Version\n\n"
#
#check_new_version () {
#
#    if ping -q -c 1 -W 1 google.com >/dev/null; then
#        checked_version=$(curl -s https://raw.githubusercontent.com/JayKotadia/ADB-Toolkit/master/modules/version)
#        if [ "$checked_version" != "$current_version" ]
#            then
#                echo -e "Current Version = $current_version , New Version = $checked_version"
#                echo -e "\n\e[91;7mNew update is relased please update via git pull\e[27m\n"
#                sleep 5 | echo -e "\e[93;5mWait 5 second or update\e[0m"
#        fi
#    fi
#
#}

#check_new_version

if [ $(id -u) -ne 0 ]; then
        echo "THIS SCRIPT MUST BE RUN AS ROOT"
        exit 1
fi

if [ -d $PWD/.temp/ ]
    then
        echo -e "YOU HAVE THE .temp DIRECTORY" && clear
    else
        echo -e "PLEASE INSTALL THE TOOL IF NOT INSTALLED OR IF INSTALLED MAKE A '.temp' DIRECTORY FIRST" && exit
fi



adb_check=$(which adb) 

if [ "$?" == 0 ]; then
    echo -e "ADB IS INSTALLED\n"
    echo -e "INITALIZING ADB\n"
else
    echo -e "\nADB IS NOT INSTALLED, RUN THE INSTALLATION SCRIPT OR TRY INSTALLING 'ADB' MANUALLY"
    exit 1
fi


adb_check=$(which fastboot)

if [ "$?" == 0 ]; then
    echo -e "FASTBOOT IS INSTALLED\n"
    echo -e "INITALIZING FASTBOOT\n"
else
    echo -e "\nFASTBOOT IS NOT INSTALLED, RUN THE INSTALLATION SCRIPT OR TRY INSTALLING 'FASTBOOT' MANUALLY"
    exit 1
fi

while true; do
  read -p $'\e[93;1mDo you want to Kill & Restart the Server. \e[1;97m (Y/N) \e[93;1m? : \e[1;91m' yn
  case $yn in
  [Yy]* ) adb kill-server >/dev/null 2>&1 | echo -e "\n\nKilling previous running ADB Server." ;adb start-server >/dev/null 2>&1 | echo -e "\n\nStarting New ADB Server......" ;break;;
  [Nn]* )  echo -e "NOT RESTARTING THE SERVER" ;break;;
  * ) echo -e "\e[1;93mPlease Answer It With:\e[1;97m ( Y/N )\e[0m";;
  esac
  done

clear


banner () {

echo -e "\e[1;93m

 █████╗ ██████╗ ██████╗               ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗
██╔══██╗██╔══██╗██╔══██╗              ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝
███████║██║  ██║██████╔╝    █████╗       ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║
██╔══██║██║  ██║██╔══██╗    ╚════╝       ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║
██║  ██║██████╔╝██████╔╝                 ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║
╚═╝  ╚═╝╚═════╝ ╚═════╝                  ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝

\e[0m"
echo
echo -e "\e[93mMade with ❤️ by \e[1;91mAnonUser\e[0m"
}
bash modules/funtion.sh
