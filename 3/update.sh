#!/bin/bash

PATHCONFIG="/etc/scripts/config"
PATHHBLINK="/opt/hblink3/hblink.cfg"
PATHMMDVM="/opt/MMDVM_Bridge/MMDVM_Bridge.ini"

function VERSION3 (){
echo "Cambios en esta version $d" > change.log
echo "" >> change.log
echo "" >> change.log
echo "1. Actualizado Dashboard HBLINK" >> change.log
echo "2. Incluido cambio por menu del puerto USRP" >> change.log
echo "" >> change.log
echo "" >> change.log
dialog --no-lines --title "Listado de cambios" --textbox change.log 0 0
sudo rm change.log
#INICIO ACTUALIZACION HBLINK MONITOR
sudo apt -y update
sudo apt -y upgrade
sudo apt install -y  php7.3 libapache2-mod-php7.3 php-common php7.3-cli php7.3-common
cd /opt
sudo rm -rf HBmonitor
sudo git clone https://github.com/ea5gvk/HBmonitorDVS
sudo mv HBmonitorDVS HBmonitor
cd HBmonitor
sudo chmod +x install.sh
sudo ./install.sh
sudo mv config_SAMPLE.py config.py
sudo chmod +x monitor.py
sudo cp /opt/HBmonitor/utils/log.php /var/www/html/log.php
sudo cp /opt/HBmonitor/utils/lastheard /etc/cron.daily/lastheard
sudo chmod +x /etc/cron.daily/lastheard

sudo chown www-data /var/www/html
sudo chmod 777 /var/www/html

cadena="ExecStart=/usr/bin/screen -S hbmonitor -D -m /opt/HBmonitor/./monitor.py"
sudo sed -i "8s#.*#$cadena#" /etc/systemd/system/hbmonitor.service
#FIN  ACTUALIZACION HBLINK MONITOR

}

# ****************  INICIO ACTUALIZACION VERSION 4  *****************
function VERSION4 (){
echo "Cambios en esta version $d" > change.log
echo "" >> change.log
echo "" >> change.log
echo "1. Actualizada version HBLINK" >> change.log

echo "" >> change.log
echo "" >> change.log
dialog --no-lines --title "Listado de cambios" --textbox change.log 0 0
sudo rm change.log
#sudo cp /opt/hblink3/hblink.cfg /home/pi/hblink.cfg.backup
#sudo cp /opt/hblink3/rules.py /home/pi/rules.py.backup
sudo rm -rf /opt/hblink3
sudo rm -rf /opt/HBlink
sudo rm /lib/systemd/system/hbparrot.service
sudo rm /lib/systemd/system/hbparrot.timer
sudo rm /etc/systemd/system/hbparrot.service
sudo rm /etc/systemd/system/hbparrot.timer
sudo rm /etc/systemd/system/multi-user.target.wants/hbparrot.timer
cd /opt/
sudo git clone https://github.com/ea5gvk/hblink3DVS.git
sudo mv hblink3DVS hblink3
cd hblink3
sudo update-rc.d -f hblink3 remove
for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --no-lines --gauge "Borrando servicios. Por favor espere" 10 70 0; done
sudo rm /etc/init.d/hblink3
sudo cp hblink3.service /lib/systemd/system/hblink3.service
sudo chmod 755 /lib/systemd/system/hblink3.service
sudo ln -s /lib/systemd/system/hblink3.service /etc/systemd/system/multi-user.target.wants/hblink3.service
sudo cp hbparrot.service /lib/systemd/system/hbparrot.service
sudo chmod 755 /lib/systemd/system/hbparrot.service
sudo ln -s /lib/systemd/system/hbparrot.service /etc/systemd/system/multi-user.target.wants/hbparrot.service
#sudo cp /home/pi/hblink.cfg.backup /opt/hblink3/hblink.cfg
#sudo cp /home/pi//rules.py.backup /opt/hblink3/rules.py
#rm /home/pi/hblink.cfg.backup
#rm /home/pi/rules.py.backup
sudo systemctl daemon-reload
sudo systemctl restart hblink3.service
systemctl restart hbmonitor.service
systemctl enable systemd-networkd-wait-online.service
for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --no-lines --gauge "Actualizando servicios. Por favor espere" 10 70 0; done
rm /home/pi/fichero.txt
indicativo=$(awk 'NR==2' $PATHMMDVM) > /dev/null 2>&1
id=$(awk 'NR==3' $PATHMMDVM) > /dev/null 2>&1
echo $id > fichero.txt
echo $indicativo >> fichero.txt
sed -i 's/Callsign=/Callsign:/g' /home/pi/fichero.txt
sed -i 's/Id=/RADIO_ID:/g' /home/pi/fichero.txt
indicativo=$(awk 'NR==1' /home/pi/fichero.txt) > /dev/null 2>&1
id=$(awk 'NR==2' /home/pi/fichero.txt) > /dev/null 2>&1
sed -i "221s/.*/$indicativo/" $PATHHBLINK
sed -i "222s/.*/$id/" $PATHHBLINK



}
# ****************** FIN ACTUALIZACION VERSION 4 ******************

# ****************  INICIO ACTUALIZACION VERSION 6  *****************
function VERSION6 (){
echo "6"
#sudo apt -y install mariadb-server mariadb-client
#sudo mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('123456');FLUSH PRIVILEGES;"
#printf "123456\n n\n n\n n\n y\n y\n y\n" | sudo mysql_secure_installation
#sudo mysql -h localhost -u root -p123456   -e "CREATE DATABASE hblink";
#sudo mysql -h localhost -u root -p123456 -D hblink -s -e "CREATE TABLE rules (nombreregla VARCHAR(20),nombremaster VARCHAR(20),tsmaster VARCHAR(1),tgidmas$
#sudo mysql -h localhost -u root -p123456 -D hblink -s -e "CREATE TABLE peer (nombrepeer VARCHAR(15),puerto VARCHAR(6),ipremota VARCHAR(15),puertoremoto VA$
#sudo mysql -h localhost -u root -p123456 -D hblink -s -e "CREATE TABLE master (nombremaster VARCHAR(15),puertolocal VARCHAR(6),password VARCHAR(15),numero$
#sudo mysql -h localhost -u root -p123456 -D hblink -s -e "CREATE TABLE openbridge (puertolocal VARCHAR(6),radioid VARCHAR(9),password VARCHAR(15),ipremota$
#sudo mysql -h localhost -u root -p123456 -D hblink -s -e "CREATE TABLE xlxpeer (nombrepeer VARCHAR(15),puertolocal VARCHAR(6),ipremota VARCHAR(15),puertor$
}
# ****************** FIN ACTUALIZACION VERSION 6 ******************


echo "RECIBE DATOS DE VERSION $VER"
VERPI=$(awk 'NR==14' $PATHCONFIG)
cd /home/pi/
wget https://raw.githubusercontent.com/jabanos/jackychan/master/$VERPI/VER > /dev/null 2>&1
#wget https://raw.githubusercontent.com/jabanos/jackychan/master/desarrollo/VER > /dev/null 2>&1
VER=$(awk 'NR==1' /home/pi/VER)
rm VER
#echo $VER
#echo $VERPI
d=$(($VERPI+1))
#echo "version + 1  $d"
if [[ $d  = "3" ]]
then
     VERSION3
     sudo sed -i "14s/.*/$d/" $PATHCONFIG
     #echo "Actualizacion a version 3 realizada correctamente"
     #if [[ $d != $VER ]]
     #then
     #echo "dolar d = $d"
     #echo "VER = $VER"
     #d=$(($d+1))
     #echo "dolar d = $d"
     #echo "Incremente num version"
     fi 
fi
if [[ $d == "4" ]]
then
    VERSION4
    sudo sed -i "14s/.*/$d/" $PATHCONFIG
    dialog --no-lines --title "Salir" --msgbox "Actualizacion a version 4 realizada correctamente" 0 0
    sudo shutdown -r now
fi

if [[ $d == "5" ]]
then
    sudo sed -i "14s/.*/$d/" $PATHCONFIG
    VERSION6
    dialog --no-lines --title "Salir" --msgbox "Scripts Actualizados correctame" 0 0
    sudo shutdown -r now
fi




