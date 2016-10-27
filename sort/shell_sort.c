#include <stdio.h>
#include<stdlib.h>
#include <time.h>
#include<math.h>
//#include "data.h"
void shell_sort(char *a,int n)
{
	int g[5]={21,15,7,3,1};
	int i,j,k;
	int gap;
	char temp;
	for(i=0;i<5;i++)
	{
		gap=g[i];
		for(k=gap;k<n;k++)
		{
			
			for(j=k-gap;j>=0&&a[j]>a[j+gap];j-=gap)
			{
				temp=a[j];	
				a[j]=a[j+gap];
				a[j+gap]=temp;
			}
		}
	}
}
void data_create(int n)
{
	int i;
	srand((unsigned)time(0));
	int *a = (int *)malloc(sizeof(int)*n);
	char *ch = (char *)malloc(sizeof(char)*n);
	FILE *fp = NULL;
	
	if(!a||!ch)
	{
		printf("create array failed!\n");
		exit(1);
	}
	
	fp=fopen("input_data.txt","w+");
	if(!fp)
	{
		printf("open file failed!\n");
		exit(1);
	}
	
	for(i = 0;i<n;i++)
	{
		a[i] = rand()%26;
		ch[i] = a[i]+97;
		fputc(ch[i],fp);
	}
	free(a);
	free(ch);
	a = NULL;
	ch = NULL;
	fclose(fp);
	fp = NULL;
}
int main()
{
	int i = 0;
	int max;
	char temp;
	max = 1000000;
	printf("max=%d\n",max);
	data_create(max);
	
	char *ch=(char *)malloc(sizeof(char)*max);
	if (!ch)
	{
		printf("create array failed!\n");
	}	
	FILE *fp1 = NULL,*fp2 = NULL;
	fp1 = fopen("input_data.txt","r+");
	if(!fp1)
	{
		printf("open file failed!\n");
		exit(1);
	}
	
	temp = fgetc(fp1);
	printf("first char is:%c\n",temp);
	
	/*appeared core dump fault*/
	while(temp != EOF)
	{
		ch[i] = temp;
		i++;
		temp = fgetc(fp1);
		//printf("%c ",ch[i]);
	}
	printf("array length=%d\n",i-1);
	fclose(fp1);
	fp1=NULL;
	shell_sort(ch,max);
	fp2=fopen("output_data.txt","w+");
	if(!fp2)
	{
		printf("open file failed!\n");
		exit(1);
	}
	for(i=0;i<max;i++)
	{
		fputc(ch[i],fp2);
	}
	fclose(fp2);
	fp2=NULL;
//	printf("after sort:\n");
//	for(i=0;i<100;i++)
//	{
//		printf("%c ",ch[i]);
//	}
//	printf("\n");
	return 0;
}
