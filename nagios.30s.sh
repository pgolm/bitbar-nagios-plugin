#!/bin/bash

# <bitbar.title>Nagios</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Peter Golm</bitbar.author>
# <bitbar.author.github>pgolm</bitbar.author.github>
# <bitbar.desc>Nagios info</bitbar.desc>
# <bitbar.image>https://github.com/pgolm/bitbar-nagios-plugin/blob/master/doc/preview.png</bitbar.image>
# <bitbar.dependencies>bash</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/pgolm/bitbar-nagios-plugin/blob/master/README.md</bitbar.abouturl>

# Configuration
URL="nagios.example.com/cgi-bin/nagios3" # ie nagios.example.com
NAME="admin" 					                   # username
PASSWORD="admin"	                       # password

NAGIOS_LOGO="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"

TEMP_FILE="/tmp/nagios.out"
TAC="tac.cgi"
STATUS="status.cgi"
UP="?hostgroup=all&style=hostdetail&hoststatustypes=2"
DOWN="?hostgroup=all&style=hostdetail&hoststatustypes=4"
CRITICAL="?host=all&style=detail&servicestatustypes=16"
WARNING="?host=all&style=detail&servicestatustypes=4"
UNKNOWN="?host=all&style=detail&servicestatustypes=8"
OK="?host=all&style=detail&servicestatustypes=2"

curl -s -u "$NAME:$PASSWORD" "http://$URL/$TAC" > $TEMP_FILE

up=$(grep "$UP" $TEMP_FILE | grep Up | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
down=$(grep "$DOWN" $TEMP_FILE | grep Down | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
critical=$(grep "$CRITICAL" $TEMP_FILE | grep Critical | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
warning=$(grep "$WARNING" $TEMP_FILE | grep Warning | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
unknown=$(grep "$UNKNOWN" $TEMP_FILE | grep Unknown | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
ok=$(grep "$OK" $TEMP_FILE | grep Ok | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)

if   [ $unknown -gt 0 ];  then echo "$unknown Unknown | color=gray image=$NAGIOS_LOGO";
elif [ $warning -gt 0 ];  then echo "$warning Warning | color=orange image=$NAGIOS_LOGO";
elif [ $critical -gt 0 ]; then echo "$critical Critical | color=red image=$NAGIOS_LOGO";
elif [ $down -gt 0 ];     then echo "$down Down | color=red image=$NAGIOS_LOGO";
else                           echo "| image=$NAGIOS_LOGO"; fi

echo "---"
echo -e "Host UP:\t\t\t$up| color=green href=http://$URL/$STATUS/$UP"
echo -e "Host DOWN:\t\t\t$down| color=red href=http://$URL/$STATUS/$DOWN"
echo "---"
echo -e "Service Ok:\t\t\t $ok| color=green href=http://$URL/$STATUS/$OK"
echo -e "Service Unknown:\t $unknown| color=gray href=http://$URL/$STATUS/$UNKNOWN"
echo -e "Service Warning:\t\t $warning| color=orange href=http://$URL/$STATUS/$WARNING"
echo -e "Service Critical:\t\t $critical| color=red href=http://$URL/$STATUS/$CRITICAL"
