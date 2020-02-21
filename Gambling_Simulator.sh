#!/bin/bash

echo "--------------------------------------------------------WELL COME GAMBLING SIMULATION-------------------------------------------------"

#DECLARE A DICTIONARY
declare -A dailyCash

EVERY_DAY_STAKE=100
EVERY_DAY_BET=1
IS_WIN=1
DAYS_IN_MONTH=30
MAXWIN=$(($EVERY_DAY_STAKE+$EVERY_DAY_STAKE/2))
MAXLOOSE=$(($EVERY_DAY_STAKE-$EVERY_DAY_STAKE/2))
MONTH_IN_YEAR=1

#VARIABLE
cash=0
limit=0
dayWin=0
dayLoose=0
flag=0

#FUNCTION TO GET DAILY CASH WIN OR LOSE
function gamble()
{
	#GENERATE RANDOM NUMBER FOR GAMBLER
	randomNumber=$((RANDOM%2))
	cash=$EVERY_DAY_STAKE
	while [[ $cash -ne $MAXWIN && $cash -ne $MAXLOOSE ]]
	do
		if [ $randomNumber -eq $IS_WIN ]
		then
			cash=$(($cash+$EVERY_DAY_BET))
		else
			cash=$(($cash-$EVERY_DAY_BET))
		fi
	done
	echo "$cash"
}

#CHECK IF WIN OR LOSE UNTIL CONDITION

	for ((month=1; month<=$MONTH_IN_YEAR; month++))
	do
		for (( day=1; day<=$DAYS_IN_MONTH; day++))
		do
   		cashPerDay=$(gamble)
			if [ $cashPerDay -gt $EVERY_DAY_STAKE  ]
			then
				((dayWin++))
			else
				((dayLoose++))
			fi
   		cashPerDay=$(( $cashPerDay - $EVERY_DAY_STAKE ))
   		dailyCash[Day $day]=$cashPerDay 
   		totalCash=$(($totalCash+$(($cashPerDay))))
			totalCashMonth[$day]=$totalCash
		done
		echo "........................Month $month........................."
		echo " "
		echo "Total days won $dayWin days by $(($dayWin*50))"
		echo "Total days Loose $dayLoose days  by $(($dayLoose*50))"
		echo "Total Cash for a month:$totalCash"
		dayWin=0
		dayLoose=0
		echo " "
		min=${totalCashMonth[0]}
		max=${totalCashMonth[0]}
		maxday=0
		minday=0
for ((j=0; j<${#totalCashMonth[@]}; j++))
do
	if [ $(echo "${totalCashMonth[j]} -gt $max") ]
	then
		max=$((${totalCashMonth[j]}))
		maxday=$j
	fi
	if [ $(echo "${totalCashMonth[j]} -lt $min") ]
	then
		min=$((${totalCashMonth[j]}))
		minday=$j
	fi	
done
echo "${totalCashMonth[@]}"
echo "most lucky is day is  $maxday cash:$max"
echo "most unlucky is day is  $minday cash:$min"
echo " "
done

