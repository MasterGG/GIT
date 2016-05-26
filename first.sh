#########################################################################
# File Name: first.sh
# Author: masterchen
# mail: csr@mail.ustc.edu.cn
# Created Time: 2016年05月05日 星期四 14时34分03秒
#########################################################################
#!/bin/bash
a="hello world"
echo $a
find  -mtime -1 
if [ -n "$a" ]
then
	echo $a
else
	a="second word"
	echo $a
fi
file lz_77.c
echo what is your favorate os?
select mm in "linux" "windows" redhat "others"
do
	break
done
echo you like $mm best
for var in a b c
do
	echo var is $var
done
echo "lz*"
echo 'lz*'
echo lz*
echo lz\*
echo "$a"
echo '$a'
echo $a
