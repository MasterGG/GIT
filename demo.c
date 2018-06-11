#include <stdio.h>
#include <iostream>
#include <string.h>
using namespace std;

int main(void )
{ 
	int n;
	char s[10]= "goodddddd";
	string str ="student";
	cout<<sizeof(s)<<'\t'<<sizeof(str)<<endl;
	cout<<strlen(s)<<'\t'<<str.size()<<endl;
	cout<<(int)s[14]<<"good\t"<<(int)str[7]<<endl;
	return 0;
}
