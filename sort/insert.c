#include<stdio.h>
#include<time.h>
void insert_sort(int *a,int len)
{
	int i;
	int j;
	int key;
	for(i=1;i<len;i++)
	{
		key=a[i];
		j=i-1;	
		while(j>=0&&a[j]>key)
		{
			a[j+1]=a[j];
			j--;
		}	
		a[j+1]=key;
	}
}
int main()
{
	int a[100];
	int i;
	srand((unsigned)time(0));
	for(i=0;i<100;i++)
	{
		a[i]=rand()%100;
	}
	printf("before sort:\n");
	for(i=0;i<100;i++)
        {
               printf("%d ",a[i]);
        }
	printf("\n");
	insert_sort(a,100);
	printf("after sort:\n");
	for(i=0;i<100;i++)
        {
               printf("%d ",a[i]);
        }
	printf("\n");
	return 0;	
}
