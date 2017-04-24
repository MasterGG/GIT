#include <iostream>
#include <stdlib.h>
#include <math.h>
using namespace std;
int main()
{
	char ch;
//	cin.get(ch);
//	while(cin.fail() ==false)
//	{
//		cout<<ch;
//		cin.get(ch);
//	}
	long temp;
	srand(time(0));

	long key;
	key =(long) pow(2, 32);
	cout<<key<<endl;
	temp = rand() % key;
	cout<<temp<<endl;
	cout<<RAND_MAX<<endl;
//	ps = flower;
//	int d1, d2;
//	d1 = sizeof(ps);
//	d2 = sizeof(flower);
//	cout<<d1<<endl<<d2<<endl;
	cout<<endl;
	return 0;
}
