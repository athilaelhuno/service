#! /bin/sh
# Create by: Enrique Fermin 18Jun2015
#

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

option=$1

case $option in

"asr" )
	sudo cp marcador.sh_asr /usr/local/bin/marcador.sh
;;
"apl" )
	sudo cp marcador.sh_apl /usr/local/bin/marcador.sh
;;
esac

user=$USER
group=`groups $USER | awk -F": " '{print $2}'`

sudo cp marcador /etc/init.d/marcador

sudo touch /etc/default/marcador
sudo echo $user >> /etc/default/marcador
sudo echo $group >> /etc/default/marcador


sudo chown $user.$group /usr/local/bin/marcador.sh
sudo chown $user.$group /etc/default/marcador
sudo chown $user.$group /etc/init.d/marcador

sudo chmod +x /usr/local/bin/marcador.sh
sudo chmod +x /etc/init.d/marcador
