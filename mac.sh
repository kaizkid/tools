#!/bin/bash

echo "=======================================================";
echo " TOOLS UNTUK MENGGANTI MAC ADDRESS PERMANEN/NONPERMANEN";
echo "=======================================================";
echo "--------------------|must be root|__|" "BY : M.Husen |"; 
date +"%a"/"%b"/"%Y"                     
echo "------------------------------------|" "------------ |";
echo "";
echo "1.ganti mac addres permanen";
echo "";
echo "2.ganti mac addres sementara";
echo ""
read -p "masukan pilihan : " pil;

if [ $pil -eq 2 ];
then 
read -p "masukan interface yang akan diubah : " iface;
ifconfig $iface down;
read -p "masukan mac addres baru : " mac;
ifconfig $iface hw ether $mac;
echo "seting mac..."
ifconfig $iface up;
echo " done!!"
fi 

if [ $pil -eq 1 ]; 

then
 
cp /etc/rc.local  /var/www/

read -p "masukan interface : " ifa;
read -p "masukan mac baru  : " mek;
echo " menyeting ....";

ifconfig $ifa down;
echo " #!/bin/sh -e 
       # 
	# rc.local 
        # 
 # This script is executed at the end of each multiuser runlevel. 
 # Make sure that the script will exit 0 on success or any other 
 # value on error.
 # 
# In order to enable or disable this script just change the execution 
 # bits. 
 # 
# By default this script does nothing.
ifconfig "$ifa" down 
ifconfig "$ifa" hw ether "$mek"
ifconfig "$ifa" up
exit 0 "  >> /etc/rc.local;

fi

read -p "ingin menyimpan setingan(y/n) ? " st;
if [ $st == "y" ]; then 
read -p "tentukan lokasi file :" lk;
read -p "beri nama file : " br;
echo "
ifconfig "$ifa" down 
ifconfig "$ifa" hw ether "$mek"
ifconfig "$ifa" up" >> $lk/$br.sh
/etc/rc.local restart
echo " done !!" 

fi

if [ $st == "n" ]; then

echo " done !!";

fi
