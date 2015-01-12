#! /bin/bash

printf "Enter new passwork:\n"
stty -echo 
read pass < /dev/tty
printf "Enter again:\n"
read pass2 < /dev/tty
stty echo

printf "$pass\n"
printf "$pass2\n"