#!/bin/bash
#
# Ian - 16/11/2011
# /etc/init.d/newznab: start and stop the newznab update script
#
# run update-rc.d newznab_ubuntu.sh defaults

### BEGIN INIT INFO
# Provides:          Newznab
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start newznab at boot time
# Description:       Enable newznab service provided by daemon.
### END INIT INFO

# Newznab variables
NN_PATH=/home/jaireaux/nnplus/misc/update_scripts
NN_BINUP=update_binaries.php
NN_RELUP=update_releases.php
NN_OPTIMISE=optimise_db.php
NN_UPDATETV=update_tvschedule.php
NN_UPDATETH=update_theaters.php
NN_SLEEP_TIME=30 # in seconds . 10sec is good for 100s of groups. 600sec might be a good start for fewer.
NN_PID_PATH=/var/run/
NN_LOGFILE=/var/log/newznab_ubuntu.log

echo “Starting Newznab service update with $1.” | tee -a $NN_LOGFILE 

PIDFILE=newznab_binup.pid
LOOPCOUNTER=0
echo “Loop $LOOPCOUNTER” | tee -a $NN_LOGFILE

test -f /lib/lsb/init-functions || exit 1
. /lib/lsb/init-functions

set -e

echo "passed test" | tee -a $NN_LOGFILE

case "$1" in
  start)
    [ -f $NN_PID_PATH$PIDFILE ] && { echo -e “$0 is already ruNNing.\n” | tee -a $NN_LOGFILE; false; }
    cd $NN_PATH
    LASTOPTIMIZE=`date +%s`
    echo “Last optimize is $LASTOPTIMIZE” | tee -a $NN_LOGFILE
    (while true; do
      echo “Touching ${NN_PATH}/../monitor.txt” | tee -a $NN_LOGFILE 
      touch ${NN_PATH}/../monitor.txt
      echo “Loop $LOOPCOUNTER” | tee -a $NN_LOGFILE
      let "LOOPCOUNTER=LOOPCOUNTER+1"
      echo “Loop $LOOPCOUNTER” | tee -a $NN_LOGFILE
      cd $NN_PATH
      echo "Changed to path $NN_PATH directory" | tee -a $NN_LOGFILE
      echo “Updating binaries” | tee -a $NN_LOGFILE
      php $NN_BINUP | tee -a $NN_LOGFILE
      echo “Updating releases” | tee -a $NN_LOGFILE
      php $NN_RELUP | tee -a $NN_LOGFILE
      echo “Sleeping for $NN_SLEEP_TIME” | tee -a $NN_LOGFILE
      sleep $NN_SLEEP_TIME
      CURRTIME=`date +%s`
      echo “Current time is $CURRTIME” | tee -a $NN_LOGFILE
      DIFF=$(($CURRTIME-$LASTOPTIMIZE))
      echo “Last optimize is $LASTOPTIMIZE” | tee -a $NN_LOGFILE
      echo “Difference is $DIFF” | tee -a $NN_LOGFILE
      if [ “$DIFF” -gt 43200 ] || [ “$DIFF” -lt 1 ]
      then
        echo “Last optimize is $LASTOPTIMIZE” | tee -a $NN_LOGFILE
        LASTOPTIMIZE=`date +%s`
        echo “Optimizing stuff” | tee -a $NN_LOGFILE    
    php $NN_OPTIMISE | tee -a $NN_LOGFILE
    php $NN_UPDATETV | tee -a $NN_LOGFILE
    php $NN_UPDATETH | tee -a $NN_LOGFILE
      fi
      echo “Loop $LOOPCOUNTER” | tee -a $NN_LOGFILE
    done) &
    PID=`echo $!`
    echo $PID > $NN_PID_PATH$PIDFILE
    echo “pid is $PID” | tee -a $NN_LOGFILE
    echo “Started Newznab binaries update” ;;
  stop)
    echo “Stopping Newznab binaries update” | tee -a $NN_LOGFILE
    kill -9 `cat $NN_PID_PATH$PIDFILE`
    rm $NN_PID_PATH$PIDFILE ;;
  *)
    echo “Usage: $0 [start\|stop]”
    exit 1
esac
