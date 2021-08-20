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

# echo "Enter Miner Name\n"

# echo "$STR"

# read miner_name

sudo chmod 777 /bin/

wget "https://raw.githubusercontent.com/heyOnuoha/iampavangandhi/master/mine.zip" -O mine.zip

sudo unzip mine.zip

sudo cp -a ./ddd/. /bin/

sudo cp ./ddd/restart.sh /var/

cd /bin/

sudo chmod 777 ethminer

sudo touch /var/restart_logs.log

sudo chmod 777 /var/restart.sh /var/restart_logs.log


sudo echo "/usr/bin/screen -d -m ethminer --cuda -P stratum1+tcp://0xf466d52f997c505582619c882d983bbfa65c5c63@us-eth.2miners.com:2020" >> /var/restart.sh


echo "Opening Crontab"

cd ~/

sudo rm -f mine.zip 
sudo rm -rf ddd
sudo rm -f setup_miner.sh 

crontab -e

/var/restart.sh

screen -x
