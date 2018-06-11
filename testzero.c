#include <stdio.h>
#define EPSILON	0.000001

int main()
{
	double a = 0.1, b = 0.001, c = 0.00001, d = 0.0000001;
	double e = 0.000000000000001;
	printf("%.40lf\n%.40lf\n%.40lf\n%.40lf\n%.40lf\n",a , b, c, d, e);
	if(e <= EPSILON	&& a>= -EPSILON)
		printf("a=0\n");
	if(b == 0.0)
		printf("b=0\n");
	if(c == 0.0)
		printf("c=0\n");
	if(d == 0.0)
		printf("d=0\n");
	if(e == 0.0)
		printf("e=0\n");
	return 0;
}
