#!/bin/bash
# Scipt post-installazione per light version SalentOS 14.04
# Permette di aggiungere comodamente alcuni software alla 'versione Light di SalentOS 14.04
# Bisogna avere una connessione internet attiva!
# Verrà richiesto di inserire la password per l'utente root'
# Realizzato da blog.salentOS.it blogsalentos@gmail.com
# Questo script è free software: si può modificare/ridistribuire 
# sotto licenza # GNU General Public 
# Una copia della Licenza GNU General Public License 
# è visibile al link https://www.gnu.org/licenses/gpl-3.0.txt
#
# Definizione funzione testata
function testa()
{
echo ''
echo '#------------------------------------------------------------ #'
echo '#    SalentOS 14.04 Script Post-Installazione LIGHT version   #'
echo '#-------------------------------------------------------------#'
echo ''
}
#Definizione funnzione Scelta Si/NO
function scelta()
{
A='a'
until [[ $A = "S" || $A = "N" ]]; do
     read -p "$B - Procedere (S)/(N) ?" A
     done
}
testa
echo '#-------------------------------------------------------------#'
echo 'Questo script permette di scegliere alcuni software alla'
echo 'versione Light di SalentOS 14.04' 
echo 'Bisogna avere una connessione attiva ad Internet'
echo 'Verrà richiesta password utente root'
echo '#-------------------------------------------------------------#'
echo ''
echo ''
#Main
#
# update/dist-upgrade 
B='AGGIORNAMENTO DEL SISTEMA'
scelta
if  [ $A = 'S' ]; then          
    echo "Update del Sistema..........."        
    sudo apt-get update         
    echo "Upgrade del Sistema ........."         
    sudo apt-get dist-upgrade    
    echo "Aggiornamento Adobe Flash Player ........."    
    sudo apt-get install flashplugin-installer 
    dpkg -s cups  &>/dev/null 
    if [ "$?" -eq 1 ]; then               
       echo "CUPS - Server di stampa ........."
       sudo apt-get install cups       
    else
       echo " CUPS risulta GIA'INSTALLATA"     
       sleep 3
    fi
fi 
# INSTALLAZIONI Applicazioni# 
# Installa in Accessori > Calcolatrice
testa
B='Installazione CALCOLATRICE'
scelta
if  [ $A = 'S' ]; then          
    dpkg -s gnome-calculator &>/dev/null         
    if [ "$?" -eq 1 ]; then               
    echo "Installazione Calcolatrice..........."
    sudo apt-get install gnome-calculator       
   else
    echo "Calcolatrice risulta GIA'INSTALLATA"     
    sleep 3
    fi
fi 
# Installa in Accessori > Xarchivier
clear
testa
B="Installazione XARCHIVER (archivi compressi)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s xarchiver &>/dev/null         
    if [ "$?" -eq 1 ]; then
       echo "Installazione Xarchiver..........."
       sudo apt-get install xarchiver   
    else
       echo "Xarchiver risulta GIA'INSTALLATO"       
       sleep 3
    fi
fi 
#Installazione gnome-screenshot
clear
testa
B="Installazione GNOME-SCREENSHOT (Cattura schermate)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s gnome-screenshot &>/dev/null        
    if [ "$?" -eq 1 ]; then
       echo "Installazione gnome-screenshot..........."   
       sudo apt-get install gnome-screenshot    
    else             
       echo "gnome-screenshot risulta GIA'INSTALLATO"    
       sleep 3  
    fi
fi 
#Installazione Bleachbit
clear
testa
B="Installazione BLEACHBIT (Pulizia Sistema)"
scelta
if  [ $A = 'S' ]; then
    dpkg -s bleachbit &>/dev/null         
    if [ "$?" -eq 1 ]; then           
       echo "Installazione Bleachbit ..........."             
       sudo apt-get install bleachbit   
    else
       echo "Bleachbit risulta GIA'INSTALLATO"
       sleep 3
    fi
fi
#Installazione XscreenSaver
clear
testa
B="Installazione XscreenSaver"
scelta
if  [ $A = 'S' ]; then
    dpkg -s xscreensaver &>/dev/null         
    if [ "$?" -eq 1 ]; then           
       echo "Installazione XscreenSaver..........."             
       sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra
    else
       echo "XscreenSaver risulta GIA'INSTALLATO"
       sleep 3
    fi
fi
#Installazione Deadbeef
clear
testa
B="Installazione DEADBEEF (Player Audio)"
scelta
if  [ $A = 'S' ]; then
    dpkg -s deadbeef &>/dev/null 
    if [ "$?" -eq 1 ]; then                 
       echo "Installazione Deadbeef ..........."  
       sudo add-apt-repository ppa:alexey-smirnov/deadbeef
       sudo apt-get update
       sudo apt-get install deadbeef    
    else
       echo "Deadbeef risulta GIA'INSTALLATO"
       sleep 3
    fi
fi #Installazione Gnome-MPlayer
clear
testa
B="Installazione GNOME-MPLAYER (Player Video)"
scelta
if [ $A = 'S' ]; then
   dpkg -s gnome-mplayer &>/dev/null 
   if [ "$?" -eq 1 ]; then 
      echo "Installazione gnome-mplayer ..........."         
      sudo add-apt-repository ppa:gilir/lubuntu      
      sudo apt-get update            
      sudo apt-get install gnome-mplayer
   else
      echo "gnome-mplayer risulta GIA'INSTALLATO"
      sleep 3   
   fi
fi 
#Installazione XFBURN
clear
testa
B="Installazione XFBURN (Masterizzazione)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s xfburn &>/dev/null        
    if [ "$?" -eq 1 ]; then               
       echo "Installazione Xfburn ..........."              
       sudo apt-get install xfburn        
    else
       echo "xfburn risulta GIA'INSTALLATO"
       sleep 3  
    fi
fi 
#Installazione Mirage
clear
testa
B="Installazione MIRAGE (VIsualizzatore di Immagini)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s xfburnXfburn &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo "Installazione Mirage ..........."       
       sudo add-apt-repository ppa:vexo/ppa          
       sudo apt-get update      
       sudo apt-get install mirage      
    else
       echo "Mirage risulta GIA'INSTALLATO"
       sleep 3  
    fi
fi
#Installazione Geary Mail
clear
testa
B="Installazione GEARY (Client di Posta)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s geary &>/dev/null         
     if [ "$?" -eq 1 ]; then               
         echo  "Installazione Geary Mail ..........."
         sudo apt-get install geary     
    else
       echo "Geary Mail risulta GIA'INSTALLATO"
       sleep 3 
    fi
fi
#Installazione Pidgin 
clear
testa
B="Installazione PIDGIN (Messaggistica Instantanea)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s pidgin &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installazione Pidgin ..........."      
       sudo add-apt-repository ppa:pidgin-developers/ppa             
       sudo apt-get update      
       sudo apt-get install pidgin     
    else
       echo "Pidgin risulta GIA'INSTALLATO"
       sleep 3 
    fi
fi 
#Installazione Transmission
clear
testa
B="Installazione TRANSMISSION (Client Bittorrent)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s transmission &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installazione Pidgin ..........."      
       sudo apt-get install transmission
    else
       echo "Transmission risulta GIA'INSTALLATO"
       sleep 3  
    fi
fi 
#Installazione Gimp
clear
testa
B="Installazione GIMP (Modifica Immagini)"
scelta
if  [ $A = 'S' ]; then              dpkg -s gimp &>/dev/null         
     if [ "$?" -eq 1 ]; then               
        echo  "Installazione Gimp..........."   
        sudo add-apt-repository ppa:otto-kesselgulasch/gimp          
        sudo apt-get update
        sudo apt-get install gimp       
     else
        echo "Gimp risulta GIA'INSTALLATO"           
        sleep 3 
     fi
fi 
#Installazione Abiword
clear
testa
B="Installazione ABIWORD(word processor)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s abiword &>/dev/null        
    if [ "$?" -eq 1 ]; then  
       echo  "Installazione Abiword..........."     
       sudo apt-get install abiword     
    else
       echo "Abiword risulta GIA'INSTALLATO"         
       sleep 3 
    fi
fi 
#Installazione Gnumeric
clear
testa
B="Installazione GNUMERIC (foglio di calcolo)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s gnumeric &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installazione Gnumeric..........."             
       sudo apt-get install gnumeric    
    else             
       echo "Gnumeric risulta GIA'INSTALLATO"        
       sleep 3 
     fi
fi
 #Installazione Evince
clear
testa
B="Installazione EVINCE (lettore pdf)"
scelta
if  [ $A = 'S' ]; then          
    dpkg -s evince &>/dev/null         
     if [ "$?" -eq 1 ]; then               echo  "Installazione Evince..........."           
        sudo apt-get install evince     
     else         echo "Evince risulta GIA'INSTALLATO"       
     sleep 3    
     fi
fi 
#END SCRIPT
