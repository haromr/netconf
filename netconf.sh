#!/bin/bash
#
# Created by Harom Ramos
# netconf - switch  my wireless interface to monitor or managed modes
#
#

count=$(ifconfig | grep $(iw dev | awk '$1=="Interface"{print $2}') | wc -l ) 
 

if [ $count > 0 ]; then

ifconfig $(iw dev | awk '$1=="Interface"{print $2}') down
iwconfig $(iw dev | awk '$1=="Interface"{print $2}') mode monitor
ifconfig $(iw dev | awk '$1=="Interface"{print $2}') up

else

ifconfig $(iw dev | awk '$1=="Interface"{print $2}') down
iwconfig $(iw dev | awk '$1=="Interface"{print $2}') mode managed
ifconfig $(iw dev | awk '$1=="Interface"{print $2}') up

fi

exit

#
#
