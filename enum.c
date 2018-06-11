#include<stdio.h>
#include <iostream>
char *myString()
{
	char *buffer = new char[6];
	char *s = "Hello World!";
	for (int i = 0; i < sizeof(buffer) - 1; i++)
	{
		buffer[i] = *(s + i);
	}
	return buffer;
}
int main(int argc, char **argv)
{
	 char* ch="sdfsdfsff";
	    printf("%s\n", ch);
	    printf("%s\n", myString());
	        return 0;
}
