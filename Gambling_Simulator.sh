#!/bin/bash -x
echo"-----------------------------------WELL COME GAMBLING SIMULATION--------------------------------"

#CONSTANT
EVERY_DAY_STAKE=100;
EVERY_DAY_BET=1
WIN_CASH=$(($EVERY_DAY_STAKE + $EVERY_DAY_STAKE/2))
LOST_CASH=$(($EVERY_DAY_STAKE - $EVERY_DAY_STAKE/2))
#VARIABLE
isWin=1

#TO 
cash=$EVERY_DAY_STAKE

#TO RANDOM VALUE 0 AND 1
checkWinLoss=$((RANDOM%2))
while [[ $cash -ne $WIN_CASH && $cash -ne $LOST_CASH ]]
do
	if [ $checkWinLoss -eq $isWin ]
		then
			((cash++))
	else
			((cash--))
	fi
done

#TO PRINT
echo $cash

