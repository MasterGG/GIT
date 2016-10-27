#include<stdio.h>
#include<time.h>
void merge(int *a,int p,int q,int r)
{
	int n1,n2;
	n1=q-p+1;
	n2=r-q;
	int i,j;
	int c1[n1+1];
	int c2[n2+1];
	for(i=0;i<n1;i++)
	{
		c1[i]=a[p+i-1];
	}
	for(i=0;i<n2;i++)
	{
		c2[i]=a[q+i];
	}
	c1[n1]=100;
	c2[n2]=100;
	i=0;
	j=0;
	int k;
	for(k=p;k<=r;k++)
	{
		if(c1[i]<=c2[j])
		{
			a[k]=c1[i];
			i++;
		}	
		else
		{
			a[k]=c2[j];
			j++;
		}
	}
}
void merge_sort(int *a,int p,int r)
{
	int q;
	if(p<r)
	{
		q=(p+r)/2;
		merge_sort(a,p,q);
		merge_sort(a,q+1,r);
		merge(a,p,q,r);
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
        merge_sort(a,0,99);
        printf("after sort:\n");
        for(i=0;i<100;i++)
        {
               printf("%d ",a[i]);
        }
        printf("\n");
        return 0;
}
