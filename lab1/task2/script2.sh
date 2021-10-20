#! /usr/bin/env bash

if [ ${#} -ne 1 ]
then
    echo "need 1 param: START, STATUS or STOP"
    exit
fi


if [ "$1" == "START" ]
then

    ./script2.sh HIDDEN > /dev/null 2>&1 &
    echo $!

    exit
    
fi

if [ "$1" == "STOP" ]
then
    a=$(pgrep -f script2 | head -n1)
    if [ $a == $$ ]
    then
         echo "фоновый процесс не запущен"
    else
         kill $a
	 echo "фоновый процесс остановлен"
    fi

    exit
fi


if [ "$1" == "STATUS" ]
then
    a=$(pgrep -f script2 | head -n1)
    if [ $a == $$ ]
    then
	 echo "не запущен"
    else
	 echo "запущен"
    fi

    exit
fi


if [ "$1" == "HIDDEN" ]
then
    rm test.csv

    printf "%s%s" "date" ";" >> test.csv
    printf "%s%s" "$(cat /proc/meminfo | head -n1 | awk '{print $1;}')" ";" >> test.csv #Total_Memory
    printf "%s%s" "$(cat /proc/meminfo | head -n2 | tail -n1 | awk '{print $1;}')" ";" >> test.csv #Free_Memory
    cat /proc/meminfo | head -n3 | tail -n1 | awk '{print $1;}' >> test.csv #Avaliable_Memory

    while :
    do    
        printf "%s%s" "$(date)" ";" >> test.csv
        printf "%s%s" "$(cat /proc/meminfo | head -n1 | awk '{print $2;}')" ";" >> test.csv #Total_Memory
        printf "%s%s" "$(cat /proc/meminfo | head -n2 | tail -n1 | awk '{print $2;}')" ";" >> test.csv #Free_Memory
        cat /proc/meminfo | head -n3 | tail -n1 | awk '{print $2;}' >> test.csv #Avaliable_Memory

        sleep 10m
    done
fi

