# logspeedtest
Logs, in csv format, internet speed along the day

This script logs generate one file per day like as speedtest-yyyy-mm-dd.csv or an unique file like as speedtest.csv

You can use this script in crontab as the example below:

*/15 * * * * sudo /usr/local/bin/logspeedtest.sh -l /var/log/speedtest -u yes 2>&1 | /usr/bin/logger -t speedtest

In this example, the logspeedtest.sh runs each 15 minutes along the day.
