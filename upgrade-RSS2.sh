#!/bin/bash

# Flash Upgrade Script. Robert Olsson <robert@herjulf.se>
# Needs tty_talk avrdude, stty 
# 
# tty_talk source code:
# https://github.com/herjulf/tty_talk

DEV=/dev/ttyUSB0
BAUD=115200
SPROTO=stk500v2
MCU=atmega256rfr2

FIRMWARE=s2-atmega256rfr2.hex
[ "$1" ] && FIRMWARE=$1
FPATH=.

echo Using device=$DEV baud=$BAUD firmware=$FIRMWARE

function usb_flash
{
   #echo usb_flash 1
   avrdude -V -p $MCU -c $SPROTO -P $DEV -b $BAUD -e -U flash:w:$FPATH/$FIRMWARE 
}

function usb_flash_init
{
    #echo usb_flash_init 1
    RES=$( { tty_talk -$BAUD $DEV upgr; } 2>&1 )
    #OK=$(echo $RES | cut -d\  -f2)
    echo $RES
    [ "$OK" = OK ]
    stty -F  $DEV sane flusho
}

function upgrade_flash
{
    for (( c=0; c<=10; c++ ))
    do
	if usb_flash_init; then
	    usb_flash
	    break
	fi
    done
}

stty -F  $DEV sane flusho
upgrade_flash
