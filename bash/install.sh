#!/bin/bash
#Get current crontab
crontab -l > copy
#Set the new cron job up
echo "* * * * * curl http://127.0.0.1/cron/" >> copy
#Save the cron file
crontab copy
rm copy
#Get current sudo crontab
crontab -l > copy
#Set the new cron job up
echo "@reboot sudo systemctl start homeware" >> copy
#Save the cron file
crontab copy
rm copy
