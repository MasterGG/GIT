#include <iostream>
#include <vector>
#define	MAX 10000
using namespace std;

int partition(int *a,int p,int r)
{
	int i,j;
	int x;
	x=a[r];
	i=p-1;
	int temp;
	for(j=p;j<r;j++)
	{
		if(a[j] > x)
		{
			i++;
			if(i != j)
			swap(a[j], a[i]);
		}
	}
	swap(a[i+1], a[r]);
	return i+1;
}

int qsort(int *a,int p,int r, int k)
{
	if(p<=r)
	{
		int q;
		q=partition(a,p,r);
		if((q - p + 1) == k)	return a[q]; 
		else if((q - p + 1) > k)	return qsort(a, p, q - 1, k);	
		else if((q - p + 1) < k)	return qsort(a, q+1, r, k -(q-p+1));	
	}
}
int main()
{
	int vec[MAX];
        int i = 0;
	int k;
	int temp;
	while(cin>>temp)
	{
		vec[i] = temp;
		i++;
	}
	int len = i;

	k = vec[len -1];
	int result = qsort(vec, 0, len -2, k);
	cout<<result<<endl;
        return 0;
}
