#!/bin/bash

#Get current crontab
crontab -l > copy
#Set the new cron job up
echo "* * * * * curl http://127.0.0.1/cron/" >> copy
#Save the cron file
crontab copy
rm copy

sudo cp configuration_templates/homeware.service /lib/systemd/system/

#sudo systemctl start homeware
#sudo systemctl stop homeware
#sudo systemctl status homeware

#Get current sudo crontab
sudo crontab -l > copy
#Set the new cron job up
echo "@reboot sudo systemctl start homeware" >> copy
#Save the cron file
sudo crontab copy
rm copy

#sudo systemctl start homeware
