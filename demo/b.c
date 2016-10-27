/*************************************************************************
	> File Name: b.c
	> Author: masterchen
	> Mail: csr@mail.ustc.edu.cn
	> Created Time: 2016年05月12日 星期四 11时22分55秒
 ************************************************************************/
=======================================================

#include<stdio.h>
#include<stdlib.h>
int main()
{
	int num=1;
	int child;
	if(!(child=vfork()))
	{
		printf("is child :%d.pid=%d\n",++num,getpid());
		exit(0);
	}
	else
		printf("is father :%d.pid=%d\n",num,getpid());
	return 0;
}
