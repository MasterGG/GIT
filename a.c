#include<stdlib.h>
#include<stdio.h>
int main()
{
	int i;
    int num=1;
	int child1;
	int child2;
	child1=vfork();
	child2=vfork();
	printf("child:%d\n",child1);
	printf("this is son ,his num is :%d. and his pid is :%d\n",++num,getpid());
//	printf("father:%d\n",childdd);
//	exit(0);
	exit_group(0);
	printf("this is father,his num is :%d. and his pid is :%d\n",num,getpid());
	return 0;
}
