!/bin/bash
# Post-installazione script v2.1 for SalentOS 14.04 light version 
# Allows even those who have no knowledge of Linux to easily add some software 
# to the 'Light' version of SalentOS 14.04. 
# You need an active internet connection! 
# You will be prompted to enter the password for the root user.!
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
# This script is free software: you can edit / redistribute under the GNU General Public License.
# The GNU Manifesto is visible at the link https://www.gnu.org/licenses/gpl-3.0.txt.
# The code is displayed on GitHub site to the address
# https://github.com/rciotola/SalentOS/edit/master/script-salentos-post_inst-eng-v2_1.sh
#
# Definizione funzione testata
function testa()
{
echo ''
echo '#------------------------------------------------------------------ #'
echo '#    SalentOS 14.04 Script Post-Installation script LIGHT version   #'
echo '#-------------------------------------------------------------------#'
echo ''
}
#Definizione funzione Scelta Si/NO
function scelta()
{
A='a'
until [[ $A = "Y" || $A = "N"  || $A = "n" || $A = "y" ]]; do
     read -p "$B - Confirm (Y)/(N) ?" A
     done
}
clear
testa
echo '#--------------------------------------------------------------------#'
echo 'This script allows you to install softwares that are not presents in'
echo 'SalentOS 14.04 light version' 
echo 'You need an active internet connection'
echo 'You will be prompted to enter the password for the root user'
echo '#-------------------------------------------------------------------#'
echo ''
echo ''
#Main
TOT=0
REP="Installed softwares:"
#
# update/dist-upgrade 
B='SYSTEM UPDATE'
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then          
    echo "UPDATING SYSTEM ........."        
    sudo apt-get update         
    echo "UPGRADING SYSTEM........."         
    sudo apt-get dist-upgrade    
    echo Adobe Flash Player Update ........."    
    sudo apt-get install flashplugin-installer 
    dpkg -s cups  &>/dev/null 
    if [ "$?" -eq 1 ]; then               
       echo "CUPS - Print Server ........"
       sudo apt-get install cups       
       REP='\n'$REP'Print Server CUPS'
       TTOT=$(($TOT+1))
    else
       echo " CUPS IT IS ALREADY INSTALLED"   
       sleep 1.5
    fi
fi 
# INSTALLAZIONI Applicazioni# 
# Installa in Accessori > Calcolatrice
testa
B='INSTALL CALCULATOR'
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s gnome-calculator &>/dev/null         
    if [ "$?" -eq 1 ]; then               
    echo "instalation of Calculator ..........."
    sudo apt-get install gnome-calculator 
    REP=$REP'\n'"Calcolatrice"
    TOT=$(($TOT+1))
   else
    echo "Calculator IT IS ALREADY INSTALLED"     
    sleep 1.5
    fi
fi 
# Installa in Accessori > Xarchivier
clear
testa
B='INSTALL of XARCHIVER'
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s xarchiver &>/dev/null         
    if [ "$?" -eq 1 ]; then
       echo "Installation of  Xarchiver..........."
       sudo apt-get install xarchiver   
       REP=REP=$REP'\n'"Xarchivier"
       TOT=$(($TOT+1))
    else
       echo "Xarchiver IT IS ALREADY INSTALLED"       
       sleep 1.5
    fi
fi 
#Installazione gnome-screenshot
clear
testa
B="INSTALL  GNOME-SCREENSHOT (Save the screenshots)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s gnome-screenshot &>/dev/null        
    if [ "$?" -eq 1 ]; then
       echo "Installation of gnome-screenshot..........."   
       sudo apt-get install gnome-screenshot    
       REP=$REP'\n'"Gnome-Screenshoot"
       TOT=$(($TOT+1))
    else             
       echo "gnome-screenshot IT IS ALREADY INSTALLED"    
       sleep 1.5
    fi
fi 
#Installazione Bleachbit
clear
testa
B="INSTALL of BLEACHBIT (Cleaning System)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s bleachbit &>/dev/null         
    if [ "$?" -eq 1 ]; then           
       echo "Installation of Bleachbit ..........."             
       sudo apt-get install bleachbit   
       REP=$REP'\n'"Bleachbit"
       TOT=$(($TOT+1))
    else
       echo "Bleachbit IT IS ALREADY INSTALLED"
       sleep 1.5
    fi
fi
#Installazione XscreenSaver
clear
testa
B="INSTALL of XscreenSaver"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s xscreensaver &>/dev/null         
    if [ "$?" -eq 1 ]; then           
       echo "Installation of XscreenSaver..........."             
       sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra
       REP=$REP'\n'"XscreenSaver'"
       TOT=$(($TOT+1))
    else
       echo "XscreenSaver IT IS ALREADY INSTALLED"
       sleep 1.5
    fi
fi
#Installazione Gnome-MPlayer
clear
testa
B="INSTALL of GNOME-MPLAYER (Player Audio/Video)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
   dpkg -s gnome-mplayer &>/dev/null 
   if [ "$?" -eq 1 ]; then 
      echo "Installation of gnome-mplayer ..........."         
      sudo add-apt-repository ppa:gilir/lubuntu      
      sudo apt-get update            
      sudo apt-get install gnome-mplayer
      REP=$REP'\n'"Gnome-Mplayer"
       TOT=$(($TOT+1))
   else
      echo "gnome-mplayer IT IS ALREADY INSTALLED"
      sleep 1.5
   fi
fi 
#Installazione XFBURN
clear
testa
B="INSTALL of XFBURN (Burning)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s xfburn &>/dev/null        
    if [ "$?" -eq 1 ]; then               
       echo "Installation of Xfburn ..........."              
       sudo apt-get install xfburn        
       REP=$REP'\n'"Xfburn"
       TOT=$(($TOT+1))
    else
       echo "xfburn IT IS ALREADY INSTALLED"
       sleep 1.5  
    fi
fi 
#Installazione Mirage
clear
testa
B="INSTALL of MIRAGE (Immage Manager)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s mirage &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo "Installation of  Mirage ..........."       
       sudo add-apt-repository ppa:vexo/ppa          
       sudo apt-get update      
       sudo apt-get install mirage      
       REP=$REP'\n'"Mirage"
       TOT=$(($TOT+1))
    else
       echo "Mirage IT IS ALREADY INSTALLED"
       sleep 1.5  
    fi
fi
#Installazione Geary Mail
clear
testa
B="INSTALL of GEARY (mail client)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s geary &>/dev/null         
     if [ "$?" -eq 1 ]; then               
         echo  "Installation of  Geary Mail ..........."
         sudo apt-get install geary     
	 REP=$REP'\n'"Geary Mail"
         TOT=$(($TOT+1))
    else
       echo "Geary Mail IT IS ALREADY INSTALLED"
       sleep 1.5 
    fi
fi
#Installazione Pidgin 
clear
testa
B="INSTALL of PIDGIN (Instant Messaging)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s pidgin &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installation of Pidgin ..........."      
       sudo add-apt-repository ppa:pidgin-developers/ppa             
       sudo apt-get update      
       sudo apt-get install pidgin     
       REP=$REP'\n'"PidGin"
       TOT=$(($TOT+1))
    else
       echo "Pidgin IT IS ALREADY INSTALLED"
       sleep 1.5 
    fi
fi 
#Installazione Transmission
clear
testa
B="INSTALL of TRANSMISSION (Client Bit torrent)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s transmission &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installation of Trasmission ..........."      
       sudo apt-get install transmission
       REP=$REP'\n'"Transmission"
       TOT=$(($TOT+1))
    else
       echo "Transmission IT IS ALREADY INSTALLED"
       sleep 1.5
    fi
fi 
#Installazione Abiword
clear
testa
B="INSTALL of ABIWORD (word processor)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s abiword &>/dev/null        
    if [ "$?" -eq 1 ]; then  
       echo  "Installation of Abiword..........."     
       sudo apt-get install abiword     
       REP=$REP'\n'"AbiWord"
       TOT=$(($TOT+1))
    else
       echo "Abiword IT IS ALREADY INSTALLED"         
       sleep 1.5 
    fi
fi 
#Installazione Gnumeric
clear
testa
B="INSTALL of GNUMERIC (Spreadsheet)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then  
     dpkg -s gnumeric &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installation of Gnumeric..........."             
       sudo apt-get install gnumeric    
       REP=$REP'\n'"Gnumeric"
       TOT=$(($TOT+1))
    else             
       echo "Gnumeric IT IS ALREADY INSTALLED"        
       sleep 1.5 
     fi
fi
 #Installazione Evince
clear
testa
B="INSTALL of EVINCE (pdf reader)"
scelta
if  [[ $A = 'Y' || $A = 'y' ]]; then   
    dpkg -s evince &>/dev/null         
     if [ "$?" -eq 1 ]; then
        echo  "Installation of Evince..........."           
        sudo apt-get install evince     
	REP=$REP'\n'"Evince"
        TOT=$(($TOT+1))
     else
         echo "Evince risulta IT IS ALREADY INSTALLED"       
     sleep 1.5    
     fi
fi
clear
echo "POST INSTALLATION SCRIPT EXECUTED  !"
echo 'THANKS TO CHOOSE SALENTOS'
echo ''
if [ $TOT -eq 0 ]; then
   echo 'NO SOFTWARE INSTALLED'
   echo ''
 else
echo  "INSTALLED "NR."$TOT" software"
   echo -e $REP
   echo''
fi
exit
#end of script
