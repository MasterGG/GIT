/*************************************************************************
	> File Name: a.c
	> Author: masterchen
	> Mail: csr@mail.ustc.edu.cn
	> Created Time: 2016年04月24日 星期日 14时22分41秒
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
int main()
{
	int i;
	int j;
	j=sizeof(int);
	i=sizeof(unsigned int);
    printf("%d\n",i);
	printf("%d\n",j);
	printf("%d\n",RAND_MAX);
	return 0;
}
