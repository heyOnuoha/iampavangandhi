#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt-get install unzip

echo "Welcome to the ethminer setup\n"

echo "$STR"

# echo "Enter Miner Address\n"

# echo "$STR"

# read miner_address

echo "Enter Miner Name\n"

echo "$STR"

read miner_name

sudo chmod 777 /bin/

wget "https://raw.githubusercontent.com/heyOnuoha/iampavangandhi/master/mine.zip" -O mine.zip

sudo unzip mine.zip

sudo cp -a ./ddd/. /bin/

sudo cp ./ddd/restart.sh /var/

cd /bin/

sudo chmod 777 ethminer

sudo touch /var/restart_logs.log

sudo chmod 777 /var/restart.sh /var/restart_logs.log


sudo echo "/usr/bin/screen -d -m ethminer --cuda -P stratum1+tcp://0x42f2e704db3512b937fc87ee3490e9c67161fceb.${miner_name}@us-eth.2miners.com:2020" >> /var/restart.sh


echo "Opening Crontab"

cd ~/

sudo rm -f mine.zip 
sudo rm -rf mine
sudo rm -f setup_miner.sh 

/var/restart.sh

crontab -e

screen -x

