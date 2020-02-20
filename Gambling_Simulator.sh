#!/bin/bash -x
echo"-----------------------------------WELL COME GAMBLING SIMULATION--------------------------------"

#CONSTANT
EVERY_DAY_STAKE=100;
EVERY_DAY_BET=1

#VARIABLE
isWin=1

#TO 
cash=$EVERY_DAY_STAKE

#TO RANDOM VALUE 0 AND 1
checkWinLoss=$((RANDOM%2))
if [ $checkWinLoss -eq $isWin ]
then
		echo "win"
		((cash++))
else
		echo "loss"
		((cash--))
fi

#echo $EVERY_DAY_BET
echo $cash
