# Zabbix-wpscan-security-check
Wrapper scripts to get WPScan results into zabbix to monitor and alert if Wordpress is insecure or has plugin updates.

There are a number of configuration steps on the machine to run the scans.
1) wpscan is a prerequisite.
2) crontab should be added for a daily scan of the domains needed
This can look like this:

0 0 * * * /etc/zabbix/scripts/wp_scan_wrapper.sh

However, the frequency could be up to you.  I don't have a need for more than once per day scanning
3) create a directory at /tmp/wpscan_results that Zabbix can read and your crontab user can write to.
4) take the scripts above and install in /etc/zabbix/scripts
5) take the user_parameter file above and copy to /etc/zabbix/zabbix_agentd.conf.d
6) Place a custom list in /etc/zabbix/custom_lists called wp_list.txt
7) install the template above on your zabbix server and apply to the host that will be running the scans.

It could probably use to be more efficient and as most people say... use at your own risk.  I take no responsibility if you rely solely on this to know if your WordPress install is secure.
