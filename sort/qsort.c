#include<stdio.h>
#include<time.h>
int partition(int *a,int p,int r)
{
	int i,j;
	int x;
	x=a[r];
	i=p-1;
	int temp;
	for(j=p;j<r;j++)
	{
		if(a[j]<=x)
		{
			i++;
			temp=a[i];
			a[i]=a[j];
			a[j]=temp;
		}
			}
			}
	
	int q=i+1;
	return q; 
}
void qsort(int *a,int p,int r)
{
	if(p<r)
	{
		int q;
		q=partition(a,p,r);
		qsort(a,p,q-1);
		qsort(a,q+1,r);
	}
}
int main()
{
        int a[100];
        int i;
        srand((unsigned)time(0));
        for(i=1;i<101;i++)
        {
                a[i]=rand()%100;
        }
        printf("before sort:\n");
        for(i=1;i<101;i++)
        {
               printf("%d ",a[i]);
        }
        printf("\n");
        qsort(a,1,100);
        printf("after sort:\n");
        for(i=1;i<101;i++)
        {
               printf("%d ",a[i]);
        }
        printf("\n");
        return 0;
}
