#!/bin/bash

# <bitbar.title>Nagios</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Peter Golm</bitbar.author>
# <bitbar.author.github>pgolm</bitbar.author.github>
# <bitbar.desc>Nagios info</bitbar.desc>
# <bitbar.dependencies>bash</bitbar.dependencies>

# Configuration
URL="nagios.example.com/cgi-bin/nagios3" # ie nagios.example.com
NAME="admin" 					                   # username
PASSWORD="admin"	                       # password

TEMP_FILE="/tmp/nagios.out"
TAC="tac.cgi"
STATUS="status.cgi"
DOWN="?hostgroup=all&style=hostdetail&hoststatustypes=4"
CRITICAL="?host=all&style=detail&servicestatustypes=16"
WARNING="?host=all&style=detail&servicestatustypes=4"
UNKNOWN="?host=all&style=detail&servicestatustypes=8"
OK="?host=all&style=detail&servicestatustypes=2"

curl -s -u "$NAME:$PASSWORD" "http://$URL/$TAC" > $TEMP_FILE

down=$(grep "$DOWN" $TEMP_FILE | grep Down | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
critical=$(grep "$CRITICAL" $TEMP_FILE | grep Critical | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
warning=$(grep "$WARNING" $TEMP_FILE | grep Warning | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
unknown=$(grep "$UNKNOWN" $TEMP_FILE | grep Unknown | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)
ok=$(grep "$OK" $TEMP_FILE | grep Ok | cut -d\> -f3 | cut -d\< -f1| cut -d" " -f1)

if   [ $unknown -gt 0 ];  then echo "🚨 $unknown Unknown | color=gray";
elif [ $warning -gt 0 ];  then echo "🚨 $warning Warning | color=orange";
elif [ $critical -gt 0 ]; then echo "🚨 $critical Critical | color=red";
elif [ $down -gt 0 ];     then echo "🚨 $down Down | color=purple";
else                           echo "✅ $ok Ok | color=green"; fi

echo "---"
echo "$ok Ok| color=green href=http://$URL/$STATUS/$OK"
echo "$unknown Unknown| color=gray href=http://$URL/$STATUS/$UNKNOWN"
echo "$warning Warning| color=orange href=http://$URL/$STATUS/$WARNING"
echo "$critical Critical| color=red href=http://$URL/$STATUS/$CRITICAL"
echo "$down Down| color=purple href=http://$URL/$STATUS/$DOWN"
