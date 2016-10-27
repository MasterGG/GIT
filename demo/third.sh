#########################################################################
# File Name: third.sh
# Author: masterchen
# mail: csr@mail.ustc.edu.cn
# Created Time: 2016年05月06日 星期五 09时34分22秒
#########################################################################
#!/bin/bash
echo 'please input a number'
read num
case $num in
	1)
		echo "you select 1";;
	2)
		echo 'you select 2';;
	3)
		echo you select 3;;
	*)
		echo you select others;;
esac
if [ -x "test" ]
then
	./test
else
	cat test
fi
select ss in verygood good notbad bad 
do
	break
done
echo you studied linux $ss
