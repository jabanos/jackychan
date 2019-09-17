#!/bin/bash

#<<COMMENT
PATHMMDVM="/opt/MMDVM_Bridge/MMDVM_Bridge.ini" 
PATHANALOG="/opt/Analog_Bridge/Analog_Bridge.ini" 
PATHDMR="/opt/Analog_Bridge/dmr.ini" 
PATHYSF="/opt/Analog_Bridge/ysf.ini" 
PATHDSTAR="/opt/Analog_Bridge/dstar.ini" 
PATHNXDN="/opt/Analog_Bridge/nxdn.ini" 
PATHP25="/opt/Analog_Bridge/p25.ini" 
PATHIRCDDBGATEWAY="/usr/local/etc/opendv/ircddbgateway"
PATHBRIDGENXDN="/opt/NXDNClients/NXDNGateway/NXDNGateway.ini"
PATHBRIDGEP25="/opt/P25Clients/P25Gateway/P25Gateway.ini"
PATHAMBESERVER="/etc/init.d/AMBEserver"
PATHBRIDGEYSF="/opt/YSFClients/YSFGateway/YSFGateway.ini"
#COMMENT

<<COMMENT
PATHMMDVM="/home/pi/confpruebas/MMDVM_Bridge.ini"
PATHANALOG="/home/pi/confpruebas/Analog_Bridge.ini"
PATHDMR="/home/pi/confpruebas/dmr.ini"
PATHYSF="/home/pi/confpruebas/ysf.ini"
PATHDSTAR="/home/pi/confpruebas/dstar.ini"
PATHNXDN="/home/pi/confpruebas/nxdn.ini"
PATHP25="/home/pi/confpruebas/p25.ini"
PATHIRCDDBGATEWAY="/home/pi/confpruebas/ircddbgateway"
PATHBRIDGENXDN="/home/pi/confpruebas/NXDNGateway.ini"
PATHBRIDGEP25="/home/pi/confpruebas/P25Gateway.ini"
PATHAMBESERVER="/home/pi/confpruebas/AMBEserver"
PATHBRIDGEYSF="/home/pi/confpruebas/YSFGateway.ini"
COMMENT


function DMRPLUS(){

sed -i "/#Enable=1/s/.*/Enable=1/" $PATHMMDVM

sed -i "/Address=84.232.5.113/s/.*/#Address=84.232.5.113/" $PATHMMDVM
sed -i "/Port=62031/s/.*/#Port=62031/" $PATHMMDVM
sed -i "/Password=passw0rd/s/.*/#Password=passw0rd/" $PATHMMDVM

sed -i 's/#Address=eamaster05.duckdns.org/Address=eamaster05.duckdns.org/g' $PATHMMDVM
sed -i 's/#Port=55555/Port=55555/g' $PATHMMDVM
sed -i 's/#Password=PASSWORD/Password=PASSWORD/g' $PATHMMDVM
sed -i "/#Options=StartRef=/s/.*/Options=StartRef=$REFINICIO;RelinkTime=30;Userlink=1;TS2_1=2149;/" $PATHMMDVM
sed -i "/Options=StartRef=/s/.*/Options=StartRef=$REFINICIO;RelinkTime=30;Userlink=1;TS2_1=2149;/" $PATHMMDVM



sed -i "84s/.*//" $PATHMMDVM
sed -i "85s/.*//" $PATHMMDVM
sed -i "86s/.*//" $PATHMMDVM


}

function BRANDMEISTER(){

sed -i 's/#Enable=1/Enable=1/g' $PATHMMDVM

sed -i 's/#Address=84.232.5.113/Address=84.232.5.113/g' $PATHMMDVM
sed -i 's/#Port=62031/Port=62031/g' $PATHMMDVM
sed -i 's/#Password=passw0rd/Password=passw0rd/g' $PATHMMDVM

sed -i "/Address=eamaster05.duckdns.org/s/.*/#Address=eamaster05.duckdns.org/" $PATHMMDVM
sed -i "/Port=55555/s/.*/#Port=55555/" $PATHMMDVM
sed -i "/Password=PASSWORD/s/.*/#Password=PASSWORD/" $PATHMMDVM
sed -i "/Options=StartRef=/s/.*/#Options=StartRef=4374;RelinkTime=30;Userlink=1;TS2_1=2149;/" $PATHMMDVM


sed -i "84s/.*//" $PATHMMDVM
sed -i "85s/.*//" $PATHMMDVM
sed -i "86s/.*//" $PATHMMDVM


}

function HBLINK(){

sed -i "/Address=eamaster05.duckdns.org/s/.*/#Address=eamaster05.duckdns.org/" $PATHMMDVM
sed -i "/Port=55555/s/.*/#Port=55555/" $PATHMMDVM
sed -i "/Password=PASSWORD/s/.*/#Password=PASSWORD/" $PATHMMDVM
#sed -i "/Options=StartRef=4374;RelinkTime=30;Userlink=1;TS2_1=2149;/s/.*/#Options=StartRef=4374;RelinkTime=30;Userlink=1;TS2_1=2149;/" $PATHMMDVM
sed -i "/Options=StartRef=/s/.*/#Options=StartRef=4374;RelinkTime=30;Userlink=1;TS2_1=2149;/" $PATHMMDVM
sed -i "/Address=84.232.5.113/s/.*/#Address=84.232.5.113/" $PATHMMDVM
sed -i "/Port=62031/s/.*/#Port=62031/" $PATHMMDVM
sed -i "/Password=passw0rd/s/.*/#Password=passw0rd/" $PATHMMDVM

sed -i "84s/.*/Address=$IP/" $PATHMMDVM
sed -i "85s/.*/Port=$PUERTO/" $PATHMMDVM
sed -i "86s/.*/Password=$PASS/" $PATHMMDVM


}

function AMBESI(){
sed -i 's/;address = 127.0.0.1/address = 127.0.0.1/g' $PATHANALOG
sed -i 's/;rxPort = 2471/rxPort = 2471/g' $PATHANALOG
sed -i 's/;serial = false/serial = false/g' $PATHANALOG
#sed -i "s/;baud =/baud = $VELOCIDAD/g" $PATHANALOG
sed -i "s/460800/$VELOCIDAD/g" $PATHAMBESERVER
sed -i "s/230400/$VELOCIDAD/g" $PATHAMBESERVER




sed -i 's/;address = 127.0.0.1/address = 127.0.0.1/g' $PATHDMR
sed -i 's/;rxPort = 2471/rxPort = 2471/g' $PATHDMR
sed -i 's/;serial = false/serial = false/g' $PATHDMR
#sed -i "s/;baud =/baud = $VELOCIDAD/g" $PATHDMR

sed -i 's/;address = 127.0.0.1/address = 127.0.0.1/g' $PATHYSF
sed -i 's/;rxPort = 2471/rxPort = 2471/g' $PATHYSF
sed -i 's/;serial = false/serial = false/g' $PATHYSF
#sed -i "s/;baud =/baud = $VELOCIDAD/g" $PATHYSF

sed -i 's/;address = 127.0.0.1/address = 127.0.0.1/g' $PATHDSTAR
sed -i 's/;rxPort = 2471/rxPort = 2471/g' $PATHDSTAR
sed -i 's/;serial = false/serial = false/g' $PATHDSTAR
#sed -i "s/;baud =/baud = $VELOCIDAD/g" $PATHDSTAR


sed -i 's/;address = 127.0.0.1/address = 127.0.0.1/g' $PATHNXDN
sed -i 's/;rxPort = 2471/rxPort = 2471/g' $PATHNXDN
sed -i 's/;serial = false/serial = false/g' $PATHNXDN
#sed -i "s/;baud =/baud = $VELOCIDAD/g" $PATHNXDN


sed -i 's/;address = 127.0.0.1/address = 127.0.0.1/g' $PATHP25
sed -i 's/;rxPort = 2471/rxPort = 2471/g' $PATHP25
sed -i 's/;serial = false/serial = false/g' $PATHP25
#sed -i "s/;baud =/baud = $VELOCIDAD/g" $PATHP25



}
function AMBENO(){
sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHANALOG
sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHANALOG
sed -i "35s/.*/address = 127.0.0.1/" $PATHMMDVM

sed -i "/rxPort = 2471/s/.*/;rxPort = 2471/" $PATHANALOG
sed -i "/serial = false/s/.*/;serial = false/" $PATHANALOG
#sed -i "/baud =/s/.*/;baud =/" $PATHANALOG



sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHDMR
sed -i "35s/.*/address = 127.0.0.1/" $PATHDMR
sed -i "/rxPort = 2471/s/.*/;rxPort = 2471/" $PATHDMR
sed -i "/serial = false/s/.*/;serial = false/" $PATHDMR
#sed -i "/baud =/s/.*/;baud =/" $PATHDMR

sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHYSF
sed -i "33s/.*/address = 127.0.0.1/" $PATHYSF

sed -i "/rxPort = 2471/s/.*/;rxPort = 2471/" $PATHYSF
sed -i "/serial = false/s/.*/;serial = false/" $PATHYSF
#sed -i "/baud =/s/.*/;baud =/" $PATHYSF

sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHDSTAR
sed -i "35s/.*/address = 127.0.0.1/" $PATHDSTAR
sed -i "/rxPort = 2471/s/.*/;rxPort = 2471/" $PATHDSTAR
sed -i "/serial = false/s/.*/;serial = false/" $PATHDSTAR
#sed -i "/baud =/s/.*/;baud =/" $PATHDSTAR

sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHNXDN
sed -i "34s/.*/address = 127.0.0.1/" $PATHNXDN
sed -i "/rxPort = 2471/s/.*/;rxPort = 2471/" $PATHNXDN
sed -i "/serial = false/s/.*/;serial = false/" $PATHNXDN
#sed -i "/baud =/s/.*/;baud =/" $PATHNXDN

sed -i "/address = 127.0.0.1/s/.*/;address = 127.0.0.1/" $PATHP25
sed -i "33s/.*/address = 127.0.0.1/" $PATHP25
sed -i "/rxPort = 2471/s/.*/;rxPort = 2471/" $PATHP25
sed -i "/serial = false/s/.*/;serial = false/" $PATHP25
#sed -i "/baud =/s/.*/;baud =/" $PATHP25

}

function GATE(){
rep=77

sed -i "/Callsign=/s/.*/Callsign=$INDICATIVO/" $PATHBRIDGENXDN
sed -i "/Callsign=/s/.*/Callsign=$INDICATIVO/" $PATHBRIDGEP25

sed -i "/Callsign=/s/.*/Callsign=$INDICATIVO/" $PATHBRIDGEYSF
sed -i "/Id/s/.*/Id=$DMRID/" $PATHBRIDGEYSF


sed -i "/gatewayDmrId/s/.*/gatewayDmrId =$DMRID/" $PATHANALOG
sed -i "/repeaterID/s/.*/repeaterID =$DMRID$rep/" $PATHANALOG

sed -i "/gatewayDmrId/s/.*/gatewayDmrId =$DMRID/" $PATHDMR
sed -i "/repeaterID/s/.*/repeaterID =$DMRID$rep/" $PATHDMR

sed -i "/gatewayDmrId/s/.*/gatewayDmrId =$DMRID/" $PATHYSF
sed -i "/repeaterID/s/.*/repeaterID =$DMRID$rep/" $PATHYSF

sed -i "/gatewayDmrId/s/.*/gatewayDmrId =$DMRID/" $PATHDSTAR
sed -i "/repeaterID/s/.*/repeaterID =$DMRID$rep/" $PATHDSTAR

sed -i "/gatewayDmrId/s/.*/gatewayDmrId =$DMRID/" $PATHNXDN
sed -i "/repeaterID/s/.*/repeaterID =$DMRID$rep/" $PATHNXDN

sed -i "/gatewayDmrId/s/.*/gatewayDmrId =$DMRID/" $PATHP25
sed -i "/repeaterID/s/.*/repeaterID =$DMRID$rep/" $PATHP25

sed -i "/Callsign/s/.*/Callsign=$INDICATIVO/" $PATHMMDVM
sed -i "/Id=/s/.*/Id=$DMRID$rep/" $PATHMMDVM

dim=${DMRID%?????}
dim2=${DMRID#$dim}
sed -i "59s/.*/id=$dim2/" $PATHMMDVM


INDICATIVO=${INDICATIVO,,}
sed -i "/ircddbUsername/s/.*/ircddbUsername=$INDICATIVO/" $PATHIRCDDBGATEWAY
INDICATIVO=${INDICATIVO^^}
sed -i "/gatewayCallsign/s/.*/gatewayCallsign=$INDICATIVO/" $PATHIRCDDBGATEWAY
sed -i "/dplusLogin/s/.*/dplusLogin=$INDICATIVO C/" $PATHIRCDDBGATEWAY



}

echo "           Configurador DVSWITCH by EA7JCL" > fichero.txt
echo "              (BLASMAKERS @ EA5GVK.ES)" >> fichero.txt
echo "" >> fichero.txt
echo "En las siguientes ventanas se le ira pidiendo informacion" >> fichero.txt
echo "             para completar la configuracion" >> fichero.txt
echo "" >> fichero.txt
dialog --no-lines --title "" --textbox fichero.txt 0 0
rm -f fichero.txt
INDICATIVO=`dialog --no-lines --stdout --title "Configurador DVSWITCH" --inputbox "Escribe indicativo" 0 0`
DMRID=`dialog --no-lines --stdout --title "Configurador DVSWITCH" --inputbox " Escribe DMRID" 0 0`


DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --clear --no-lines --title "Configurador DVSWITCH" \
        --menu "Selecciona la red que quieres configurar" 0 0 0 \
        "Brandmeister"  "" \
        "DMR+" "" \
        "HBLINK" "Configura aqui los datos de tu servidor" 2> $tempfile
retval=$?

seleccionred=`cat $tempfile`
if [[ $seleccionred = "DMR+" ]]
then
   REFINICIO=`dialog --no-lines --stdout --title "Configurador DMR+" --inputbox "Escribe reflector de inicio" 0 0`
fi 
if [[ $seleccionred = "HBLINK" ]]
 then
    IP=`dialog --no-lines --stdout --title "Configurador HBLINK" --inputbox "Escribe IP o URL" 0 0`
    PUERTO=`dialog --no-lines --stdout --title "Configurador HBLINK" --inputbox "Escribe Puerto UDP" 0 0`
    PASS=`dialog --no-lines --stdout --title "Configurador HBLINK" --inputbox "Escribe Contraseña" 0 0`


fi
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --clear --no-lines --title "Configurador DVSWITCH" \
        --menu "Selecciona el modo que quieres usar" 0 0 0 \
        "AMBE FISICO"  "AMBE3000 USB" \
        "AMBE EMULADO" "EMULADOR MD380"  2> $tempfile
retval=$?

seleccionmodo=`cat $tempfile`
 if [[ $seleccionmodo = "AMBE FISICO" ]]
 then
    $DIALOG --clear --no-lines --title "Configurador DVSWITCH" \
        --menu "Selecciona la velocidad de tu AMBE" 0 0 0 \
        "230400"  "" \
        "460800" ""  2> $tempfile
retval=$?

VELOCIDAD=`cat $tempfile`

fi

echo "Se actualizara el software con la siguiente informacion:" > fichero.txt
echo "" >> fichero.txt
echo "INDICATIVO: " $INDICATIVO >> fichero.txt
echo "DMR ID    : " $DMRID >> fichero.txt
echo "RED SELECCIONADA: " $seleccionred >> fichero.txt
echo "MODO FUNCIONAMIENTO:" $seleccionmodo >> fichero.txt
echo "" >> fichero.txt
echo "Se pedira confirmacion en la siguiente ventana" >> fichero.txt

dialog --no-lines --title "" --textbox fichero.txt 0 0

if dialog --no-lines --title "¿Grabar configuracion?"  --yesno "¿Quieres grabar la configuracion?" 0 0 ;then
    
    GATE
    if [[ $seleccionred = "DMR+" ]] 
    then
      #echo "DMR+"
      DMRPLUS
    elif [[ $seleccionred = "Brandmeister" ]]
    then
      #echo "Brandmeister"
      BRANDMEISTER
    else
	#echo "HBLINK"
        HBLINK
    fi
    if [[ $seleccionmodo = "AMBE FISICO" ]]
    then
      #echo "configurar como ambe fisico"
      AMBESI
    else
      #echo "configurar como ambe emulado"
      AMBENO
    fi
dialog --no-lines --title "Completado" --msgbox "Configuracion guardada.  El sistema se reiniciara." 0 0
 rm -f fichero.txt
sudo shutdown -r now
else
    #echo "no grabar"
    dialog --no-lines --title "Salir" --msgbox "No guardado" 0 0
    source /home/pi/menu
fi

clear
rm -f fichero.txt
echo -e "\n"




