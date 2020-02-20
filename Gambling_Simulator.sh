#!/bin/bash -x
echo"-----------------------------------WELL COME GAMBLING SIMULATION--------------------------------"

declare -a TotalCashMonth
#CONSTANT
EVERY_DAY_STAKE=100
EVERY_DAY_BET=1
IS_WIN=1
DAYS_IN_MONTH=30

#VARIABLE
maxWin=$(($EVERY_DAY_STAKE+$EVERY_DAY_STAKE/2))
maxLoose=$(($EVERY_DAY_STAKE-$EVERY_DAY_STAKE/2))

#CHECK IF WIN OR LOSE UNTIL CONDITION
for (( index=1; index<=$DAYS_IN_MONTH; index++))
do
cash=$EVERY_DAY_STAKE

while [[ $cash -ne $maxWin  &&  $cash -ne $maxLoose ]]
do
	randomNumber=$((RANDOM%2))
if [ $randomNumber -eq $IS_WIN ]
then
	((winCount++))
	((cash++))
else
	((loseCount++))
	((cash--))
fi
done
	winCount=0
	loseCount=0
	cash=$(( cash - EVERY_DAY_STAKE ))
	totalcash=$(($totalcash+$(($cash))))
	TotalCashMonth[index]={$totalcash}
if [ $cash -gt 0 ]
then
		echo "win:$cash"
else
		echo "lost:$cash"
fi
done
echo "Total Cash:$totalcash"

