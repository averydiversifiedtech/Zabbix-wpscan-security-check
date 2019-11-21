#!/bin/bash
wp_sites="/etc/zabbix/custom_lists/wp_list.txt"
while IFS= read -r url
do
echo $url
sanitized_url=`echo $url | sed 's/\:\/\///'`
touch /tmp/wpscan_results/wpscan_$sanitized_url.txt
wpscan --url $url --random-user-agent > /tmp/wpscan_results/wpscan_$sanitized_url.txt
done < "$wp_sites"
