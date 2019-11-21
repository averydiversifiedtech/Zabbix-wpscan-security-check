#!/bin/bash
#let's expect our first option to be the site address including url
#since we saved the wpscan files with a sanitized version stripping out :// we'll do the same here to find the file
sanitized_url=`echo $1 | sed 's/\:\/\///'`
#does our output from wpscan exist?
if test -f "/tmp/wpscan_results/wpscan_$sanitized_url.txt"; then
    exists=1
#probably not the most efficient way to do this.  May need to revisit for large lists of hosts.
#get a report of the WordPress version
version=`cat /tmp/wpscan_results/wpscan_$sanitized_url.txt | grep "WordPress version" | sed 's/^.*ersion //' | sed 's/ identified.*$//'`
#does wpscan think this version is insecure?
insecure=`cat /tmp/wpscan_results/wpscan_$sanitized_url.txt | grep "Insecure" |wc -l`
#how many plugins are outdated?
plugins=`cat /tmp/wpscan_results/wpscan_$sanitized_url.txt | grep "out of date" |wc -l`
else
exists=0
fi
#which option did we get called with by zabbix
case $2 in
 "--version")
echo $version
;;
 "--insecure")
echo $insecure
;;
 "--plugins")
echo $plugins
;;
 "--exists")
echo $exists
;;
esac
