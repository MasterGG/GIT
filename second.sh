#########################################################################
# File Name: second.sh
# Author: masterchen
# mail: csr@mail.ustc.edu.cn
# Created Time: 2016年05月05日 星期四 16时41分03秒
#########################################################################
#!/bin/bash
echo "please input a number"
echo "your number is:"
read num num2
echo num is $num
echo num2 is $num2
case $num   in
	1)
		echo you select 1;;
	2) echo you select 2;;
	3)echo you select 3;;
	4) echo "you select 4";;
	*)echo "you select nothing";;
	
esac
