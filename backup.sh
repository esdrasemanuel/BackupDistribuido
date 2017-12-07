#!/bin/bash

while getopts "c:d:t:" OPTVAR
do
        if [ $OPTVAR == "c" ]
        then
                conf=$OPTARG
        fi

        if [ $OPTVAR == "d" ]
        then
                diretorio=$OPTARG
        fi

        if [ $OPTVAR == "t" ]
        then
                tempo=$OPTARG
        fi
done


exec 3< $conf

while read arq <&3
do
	ip=`echo "$arq" | cut -d" " -f1`
	user=`echo "$arq" | cut -d" " -f2`
	senha=`echo "$arq" | cut -d" " -f3`
	dir=`echo "$arq" | cut -d" " -f4`

	screen ./backupOperations.sh $ip $user $senha $dir $conf $tempo $diretorio

done
