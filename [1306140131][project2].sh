#!/bin/bash

arg_sayisi=$#
file=$1
average=0
bdsAverage=0
topAverage=0
differenceAverage=0
STD=0
baraj=0
failedStudents=0
successfulStudents=0
evaluatedStudents=0
i=0
b=0
c=0
array=( )
if [ $arg_sayisi -eq 1 ]; then 
	if [ -f $file ]; then
		while read line
 			do   
			array+=($i)
			
			no=$(echo $line | awk '{print $1}')


			midterm=$(echo $line | awk '{print $2}')
			final=$(echo $line | awk '{print $3}')
			average=$( bc <<< 'scale=3; ('$midterm' + '$final') / 2')
			if [  $(echo $average" > 35" | bc) -ne 0  ]; then

				bdsAverage=$( bc <<< 'scale=3;'$bdsAverage'+'$average)
				(( evaluatedStudents+=1 ))
				

			else 
				(( failedStudents+=1 ))
				array[i]=0


			fi
			(( i=$i+1 ))
		done <  <(tr -d '\r' < $file )
	
		bdsAverage=$( bc <<< 'scale=3;'$bdsAverage'/'$i)
		
		while read line
 			do   
			if [ ${array[b]} -eq $b ]; then #"Eger daha once fail edildiyse BDS degerlendirmesine katma."
			
			
			

			

			midterm=$(echo $line | awk '{print $2}')
			final=$(echo $line | awk '{print $3}')
			average=$( bc <<< 'scale=3; ('$midterm' + '$final') / 2')

			differenceAverage=$( bc <<< 'scale=3;  
			('$average'-'$bdsAverage')*('$average'-'$bdsAverage')+'$differenceAverage)
			fi
			(( b=$b+1 ))
		done <  <(tr -d '\r' < $file)

		STD=$( bc <<< 'scale=3; sqrt(('$differenceAverage')/('$b'-1))')

		baraj=$( bc <<< 'scale=3;'$bdsAverage'-1.645*'$STD)


		if [ $evaluatedStudents -lt 10 ] || [  $(echo $STD" < 8" | bc) -ne 0  ]; then
			(( baraj=45 ))

		fi

		while read line
 			do   
			if [ ${array[c]} -eq $c ]; then #"Eger daha once fail edildiyse BDS degerlendirmesine katma."
			
			

			midterm=$(echo $line | awk '{print $2}')
			final=$(echo $line | awk '{print $3}')
			average=$( bc <<< 'scale=3; ('$midterm' + '$final') / 2')

			if [  $(echo $final" >= 45" | bc) -ne 0  ] && 
			   [  $(echo $average" > "$baraj | bc) -ne 0  ]; then
				(( successfulStudents+=1 ))
			else 

				(( failedStudents+=1 ))

			fi

			fi
			(( c=$c+1 ))
		done <  <(tr -d '\r' < $file)

		
	echo $failedStudents "students failed in this course"
	

	else
		echo "There isn't notlar.txt file."

	fi

else

echo "Argument number must be equal to 1."

fi
