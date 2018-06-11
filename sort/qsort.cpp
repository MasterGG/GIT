#include <iostream>
#include <time.h>
#include <stdlib.h>
using namespace std;

void swap(int  &a, int &b)
{
//	a ^= b;
//	b ^= a;
//	a ^= b;
	int temp ;
	temp =a;
	a = b;
	b = temp;
}

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
			if(i != j)
			swap(a[j], a[i]);
		}
	}
	if(i+1 != r)
	swap(a[i+1], a[r]);
	return i+1;
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
        int a[10];
        int i;
//	a[0] = -1;
        srand((unsigned)time(0));
        for(i=0;i<10;i++)
        {
                a[i]=rand()%100;
        }

        cout<<"before sort:\n";
        for(i=0;i<10;i++)
        {
	       cout<<a[i]<<"\t";
        }
	cout<<endl;
        qsort(a,0,9);

        cout<<"after sort:\n";
        for(i=0;i<10;i++)
        {
	       cout<<a[i]<<"\t";
        }
	cout<<endl;
        return 0;
}
