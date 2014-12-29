#! /bin/bash

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=66
E_NOTROOT=67

if [[ "$UID" -ne "$ROOT_UID" ]] 
then
	echo "must be root to run this script"
	exit $E_NOTROOT
fi

if [ -n "$1" ] 
then
	lines=$1
else
	lines=$LINES
fi

cd $LOG_DIR

if [[ "$PWD" != "$LOG_DIR" ]]; then
	echo "can't change to log dir"
	exit $E_XCD
fi

tail -$lines messages > mesg.temp
mv mesg.temp messages

cat /dev/null > wtmp
echo "logs clean up"

exit 0