#!/bin/bash
clear

echo "Ini adalah program automatisasi setup vpn PLIK 2011"
#echo "Cara pakainya adalah ketik sudo su  kemudian enter"
#echo "Masukkan password komputernya kemudian enter"
#echo "Execute dengan perintah . vpnsetup.sh"
echo "Masukkan nama kecamatan"
read kecamatan
echo "Masukkan user vpn"
read uservpn
echo "Masukkan password vpn"
read passvpn
pptpsetup --create $kecamatan --server vpn.jkt.sims.co.id --username $uservpn --password $passvpn
echo "replacedefaultroute" >> /etc/ppp/peers/$kecamatan
echo "defaultroute" >> /etc/ppp/peers/$kecamatan
cd /usr/local/uso
wget http://111.92.175.162/vpnup.sh
chmod +x /usr/local/uso/vpnup.sh
echo "/usr/local/uso/vpnup.sh $kecamatan" > /etc/rc.local
echo "exit 0" >> /etc/rc.local
echo "... DONE"
echo "restarting now !"
reboot

#vi /etc/rc.local
#tambahin /usr/local/uso/vpnup.sh $namakecamatan
#reboot
#cek pake ip route
