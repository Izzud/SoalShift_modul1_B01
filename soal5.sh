#!/bin/bash
cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && !/bash/ && NF < 13 {print}' > ~/modul1/syslog
