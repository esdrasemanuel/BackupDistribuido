#!/bin/bash


ip=$1
user=$2
senha=$3
dir=$4
conf=$5
tempo=$6
diretorio=$7

remover(){

ls $diretorio > loc.txt

	sshpass -p "$senha" ssh $user@$ip "ls $dir" > $ip.txt

	for i in `cat $ip.txt`
	do

		if [ `cat loc.txt | grep -e "^$i$"` ]
		then
			echo  &>/dev/null
		else
			echo "------DEVE SER REMOVIDO o Arquivo: $i em $user@$ip"
			sshpass -p "$senha" ssh $user@$ip "rm $dir/$i"
		fi
	done

}

adicionar(){

ls $diretorio > loc.txt

        sshpass -p "$senha" ssh $user@$ip "ls $dir" > $ip.txt

	for i in `cat loc.txt`
	do
        	if [ `cat $ip.txt | grep -e "^$i$"` 2>/dev/null ]
        	then
			HLOC=`md5sum $diretorio/$i | cut -d" " -f1`
			HREM=`sshpass -p "$senha" ssh $user@$ip "md5sum $dir/$i | cut -d' ' -f1 " 2>/dev/null`

			if [ $HLOC == $HREM ]
			then
				echo  &>/dev/null

			else
                       		echo "Arquivo alterado: $i---- em $user$ip"
                        	sshpass -p "$senha" ssh $user@$ip "rm $dir/$i"
                        	sshpass -p "$senha" scp $diretorio/$i $user@$ip:$dir
                        	echo "Arquivo atualizado: $i---- em $user@$ip"
        		fi
		else

		echo "------DEVE SER ADICIONADO O Arquivo: $i---- em $user$ip"
		sshpass -p "$senha" scp $diretorio/$i $user@$ip:$dir

		fi
	done

}

while true
do
	remover
	adicionar
	sleep $tempo
done
