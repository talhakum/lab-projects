#!/bin/bash

arg_sayisi=$#
dosya=$1
secenek=$2

if [ $arg_sayisi -eq 2 ]; then


	if [ -f $dosya ]; then
		i=0;
		case $secenek in
		"-h") 	
			OUTPUT=$(awk '{t+=length($0)}END{print t}' $dosya)
			while read line
 			do   
			(( i=$i+1 ))
	
 	
			done < $dosya
			(( sonuc=$OUTPUT+$i ))
			echo $dosya "contains" $sonuc "letters."
			;;

			

		"-k") 
			while read line
 			do   
			(( i=$i+1 ))
			(( OUTPUT+=$(echo $line | awk '{printf NF}') ));

			done < $dosya
			echo $dosya "contains" $OUTPUT "words."
			;;

		"-s") 
			while read line
 			do   
			(( i=$i+1 ))
			done < $dosya
			echo $dosya "contains" $i "lines."
			;;

		*) echo "Invalid argument. Just be allowed to -h -k and -s."
		esac
	
	else
		echo "There is no any input file."

	fi

else

echo "Argument number must be equal to 2."

fi

