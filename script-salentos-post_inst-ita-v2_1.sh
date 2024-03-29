#!/bin/bash
# Scipt post-installazione v2.1 per SalentOS 14.04 light 
# Permette di aggiungere comodamente alcuni software alla 'versione Light di SalentOS 14.04
# Bisogna avere una connessione internet attiva!
# Verrà richiesto di inserire la password per l'utente root'
# Realizzato da blog.salentOS.it blogsalentos@gmail.com
# Autore: Ciotola Rosario 
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
until [[ $A = "S" || $A = "N"  || $A = "n" || $A = "s" ]]; do
     read -p "$B - Procedere (S)/(N) ?" A
     done
}
clear
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
TOT=0
REP="Elenco Software Installati :"
#
# update/dist-upgrade 
B='AGGIORNAMENTO DEL SISTEMA'
scelta
if  [[ $A = 'S' || $A = 's' ]]; then          
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
       REP='\n'$REP'Server di stampa CUPS'
       TTOT=$(($TOT+1))
    else
       echo " CUPS risulta GIA'INSTALLATA"   
       sleep 1.5
    fi
fi 
# INSTALLAZIONI Applicazioni# 
# Installa in Accessori > Calcolatrice
testa
B='Installazione CALCOLATRICE'
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s gnome-calculator &>/dev/null         
    if [ "$?" -eq 1 ]; then               
    echo "Installazione Calcolatrice..........."
    sudo apt-get install gnome-calculator 
    REP=$REP'\n'"Calcolatrice"
    TOT=$(($TOT+1))
   else
    echo "Calcolatrice risulta GIA'INSTALLATA"     
    sleep 1.5
    fi
fi 
# Installa in Accessori > Xarchivier
clear
testa
B="Installazione XARCHIVER (archivi compressi)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s xarchiver &>/dev/null         
    if [ "$?" -eq 1 ]; then
       echo "Installazione Xarchiver..........."
       sudo apt-get install xarchiver   
       REP=REP=$REP'\n'"Xarchivier"
       TOT=$(($TOT+1))
    else
       echo "Xarchiver risulta GIA'INSTALLATO"       
       sleep 1.5
    fi
fi 
#Installazione gnome-screenshot
clear
testa
B="Installazione GNOME-SCREENSHOT (Cattura schermate)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s gnome-screenshot &>/dev/null        
    if [ "$?" -eq 1 ]; then
       echo "Installazione gnome-screenshot..........."   
       sudo apt-get install gnome-screenshot    
       REP=$REP'\n'"Gnome-Screenshoot"
       TOT=$(($TOT+1))
    else             
       echo "gnome-screenshot risulta GIA'INSTALLATO"    
       sleep 1.5
    fi
fi 
#Installazione Bleachbit
clear
testa
B="Installazione BLEACHBIT (Pulizia Sistema)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s bleachbit &>/dev/null         
    if [ "$?" -eq 1 ]; then           
       echo "Installazione Bleachbit ..........."             
       sudo apt-get install bleachbit   
       REP=$REP'\n'"Bleachbit"
       TOT=$(($TOT+1))
    else
       echo "Bleachbit risulta GIA'INSTALLATO"
       sleep 1.5
    fi
fi
#Installazione XscreenSaver
clear
testa
B="Installazione XscreenSaver"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s xscreensaver &>/dev/null         
    if [ "$?" -eq 1 ]; then           
       echo "Installazione XscreenSaver..........."             
       sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra
       REP=$REP'\n'"XscreenSaver'"
       TOT=$(($TOT+1))
    else
       echo "XscreenSaver risulta GIA'INSTALLATO"
       sleep 1.5
    fi
fi
#Installazione Gnome-MPlayer
clear
testa
B="Installazione GNOME-MPLAYER (Player Audio/Video)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
   dpkg -s gnome-mplayer &>/dev/null 
   if [ "$?" -eq 1 ]; then 
      echo "Installazione gnome-mplayer ..........."         
      sudo add-apt-repository ppa:gilir/lubuntu      
      sudo apt-get update            
      sudo apt-get install gnome-mplayer
      REP=$REP'\n'"Gnome-Mplayer"
       TOT=$(($TOT+1))
   else
      echo "gnome-mplayer risulta GIA'INSTALLATO"
      sleep 1.5
   fi
fi 
#Installazione XFBURN
clear
testa
B="Installazione XFBURN (Masterizzazione)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s xfburn &>/dev/null        
    if [ "$?" -eq 1 ]; then               
       echo "Installazione Xfburn ..........."              
       sudo apt-get install xfburn        
       REP=$REP'\n'"Xfburn"
       TOT=$(($TOT+1))
    else
       echo "xfburn risulta GIA'INSTALLATO"
       sleep 1.5  
    fi
fi 
#Installazione Mirage
clear
testa
B="Installazione MIRAGE (VIsualizzatore di Immagini)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s mirage &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo "Installazione Mirage ..........."       
       sudo add-apt-repository ppa:vexo/ppa          
       sudo apt-get update      
       sudo apt-get install mirage      
       REP=$REP'\n'"Mirage"
       TOT=$(($TOT+1))
    else
       echo "Mirage risulta GIA'INSTALLATO"
       sleep 1.5  
    fi
fi
#Installazione Geary Mail
clear
testa
B="Installazione GEARY (Client di Posta)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s geary &>/dev/null         
     if [ "$?" -eq 1 ]; then               
         echo  "Installazione Geary Mail ..........."
         sudo apt-get install geary     
	 REP=$REP'\n'"Geary Mail"
         TOT=$(($TOT+1))
    else
       echo "Geary Mail risulta GIA'INSTALLATO"
       sleep 1.5 
    fi
fi
#Installazione Pidgin 
clear
testa
B="Installazione PIDGIN (Messaggistica Instantanea)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s pidgin &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installazione Pidgin ..........."      
       sudo add-apt-repository ppa:pidgin-developers/ppa             
       sudo apt-get update      
       sudo apt-get install pidgin     
       REP=$REP'\n'"PidGin"
       TOT=$(($TOT+1))
    else
       echo "Pidgin risulta GIA'INSTALLATO"
       sleep 1.5 
    fi
fi 
#Installazione Transmission
clear
testa
B="Installazione TRANSMISSION (Client Bittorrent)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s transmission &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installazione Transmission ..........."      
       sudo apt-get install transmission
       REP=$REP'\n'"Transmission"
       TOT=$(($TOT+1))
    else
       echo "Transmission risulta GIA'INSTALLATO"
       sleep 1.5
    fi
fi 
#Installazione Abiword
clear
testa
B="Installazione ABIWORD(word processor)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s abiword &>/dev/null        
    if [ "$?" -eq 1 ]; then  
       echo  "Installazione Abiword..........."     
       sudo apt-get install abiword     
       REP=$REP'\n'"AbiWord"
       TOT=$(($TOT+1))
    else
       echo "Abiword risulta GIA'INSTALLATO"         
       sleep 1.5 
    fi
fi 
#Installazione Gnumeric
clear
testa
B="Installazione GNUMERIC (foglio di calcolo)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then  
     dpkg -s gnumeric &>/dev/null         
    if [ "$?" -eq 1 ]; then               
       echo  "Installazione Gnumeric..........."             
       sudo apt-get install gnumeric    
       REP=$REP'\n'"Gnumeric"
       TOT=$(($TOT+1))
    else             
       echo "Gnumeric risulta GIA'INSTALLATO"        
       sleep 1.5 
     fi
fi
 #Installazione Evince
clear
testa
B="Installazione EVINCE (lettore pdf)"
scelta
if  [[ $A = 'S' || $A = 's' ]]; then   
    dpkg -s evince &>/dev/null         
     if [ "$?" -eq 1 ]; then
        echo  "Installazione Evince..........."           
        sudo apt-get install evince     
	REP=$REP'\n'"Evince"
        TOT=$(($TOT+1))
     else
         echo "Evince risulta GIA'INSTALLATO"       
     sleep 1.5    
     fi
fi
clear
echo "Script Post-Installazione Salentos Eseguito !"
echo 'Grazie per aver scelto SalentOS'
echo ''
if [ $TOT -eq 0 ]; then
   echo 'Nessun software installato'
   echo ''
 else
   echo "Installati nr. "$TOT" software"
   echo -e $REP
   echo''
fi
exit
#end of script
