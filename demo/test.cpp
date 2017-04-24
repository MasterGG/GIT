#include <iostream>
#include <math.h>
using namespace std;
int func(int);

int func(int x)
{
	int sqr, temp;
	int a[10] = {0};
	sqr = pow(x,2);
	int i, sec;
	sec = sqr;
	for(i = 0; i < 6; i++)
	{
		temp = sec%10;
		a[temp]++;
		sec /= 10;
	}
	int s = pow(10,5);
	while(sqr%s == 0 && s != 0)
	{
		a[0]--;
		s /=10;
	}
	for(i = 0; i < 10; i++)
	{
		cout<<a[i]<<endl;
	}
	for(i = 0; i < 10; i++)
	{
		if(a[i] >1)
		{
			return true;
		}
	}
	return false;
}
int main()
{
	bool temp;
//	for(int i = 1; i < 200; i++)
//	{
		temp = func(4);
//		if(temp)
//		{
			
//			cout<<pow(i,2)<<endl;
//		}
//	}
	return 0;
}
