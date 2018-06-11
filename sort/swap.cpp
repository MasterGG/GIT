#include <iostream>
#include <stdlib.h>
using namespace std;

void swap(int & a, int & b) 
{
	a ^= b;
	b ^= a;
	a ^= b;
}

int main()
{
	int a[2] = {2,2};
	cout<<a[0]<<"\t"<<a[1]<<endl;
	swap(a[0],a[0]);
	cout<<a[0]<<"\t"<<a[1]<<endl;
	return 0;
}
