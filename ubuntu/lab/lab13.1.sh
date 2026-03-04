sudo crontab -e

* * * * * ps -ax | wc -l >> /var/log/process_count.log
* * * * * sleep 30; ps -ax | wc -l >> /var/log/process_count.log

sudo service cron start