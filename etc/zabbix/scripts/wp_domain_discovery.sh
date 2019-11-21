#!/bin/bash
wp_sites="/etc/zabbix/custom_lists/wp_list.txt"
echo "{"
echo '    "data":['
FIRST=1
while IFS= read -r url
do
    if [ $FIRST != 0 ]; then
        FIRST=0
    else
        ELEMENT="{ \"{#DOMAIN}\":\"$DOMAIN\" },"
        echo "        $ELEMENT"
    fi
    DOMAIN=$url
done < $wp_sites
ELEMENT="{ \"{#DOMAIN}\":\"$DOMAIN\" }"
echo "        $ELEMENT"
echo '    ]'
echo "}"
