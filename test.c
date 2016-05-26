/*************************************************************************
	> File Name: test.c
	> Author: masterchen
	> Mail: csr@mail.ustc.edu.cn
	> Created Time: 2016年05月03日 星期二 15时59分52秒
 ************************************************************************/

#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
unsigned long long native_read_tsc(void)
{
	unsigned long long val;
	 asm volatile("rdtsc": "=A" (val));
	return val;
}
int main()
{
	unsigned long long val;
	unsigned long long val2;
	char name[32];
	val=native_read_tsc();
	sleep(1);
	val2=native_read_tsc();
	gethostname(name,sizeof(name));
printf("the host name is:%s\n",name);
//sleep(1);
	printf("%d\n",(val2-val)/1000000);
	return 0;
}
