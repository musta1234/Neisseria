
a=1

while [ $a -lt 37 ]
do
	echo $a

	x=$(head -n"$a" <dictionary.txt |tail -n 1|cut -f 1)
	y=$(head -n"$a" <dictionary.txt |tail -n 1|cut -f 2)

	rename -v 's/'"$x"'_/'"$y"'_/' ../reads/* 

	#mv -iv ../assemblies/"$x" ../assemblies/"$y" 
	echo "$x"' is now - '"$y"

	a=`expr $a + 1`
done

exit
