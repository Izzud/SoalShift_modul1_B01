#!/bin/bash
cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && !/bash/ {print}' > ~/modul1
