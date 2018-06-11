#include<stdio.h>
#include<time.h>
void merge(int *a,int p,int q,int r)
{
	int left_lengh,right_length;
	left_lengh =q-p+1;
	right_length=r-q;
	int i,j;
	int Left[left_lengh+1];
	int Right[right_length+1];

	for(i=0;i<left_lengh;i++)
	{
		Left[i]=a[p+i-1];
	}

	for(i=0;i<right_length;i++)
	{
		Right[i]=a[q+i];
	}
	Left  [left_lengh]=INT_MAX;
	Right[right_length]=INT_MAX;
	i=0;
	j=0;
	int k;
	for(k=p;k<=r;k++)
	{
		if(Left[i]<=Right[j])
		{
			a[k]=Left[i];
			i++;
		}	
		else
		{
			a[k]=Right[j];
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
