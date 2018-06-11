#include <stdio.h>
#include <memory.h>
#define	MAX	100
#include <stdbool.h>

void get_prime(	)
{
	bool	flag[MAX];
	int	prime[MAX/3 + 1];      
	int temp = 0;
	memset(flag, false, sizeof(prime));
	for(int i = 0; i < 20; i++)
	{
		printf("%d\t", flag[i]);
	}
	printf("\n\n");
	for(int i = 2; i <= MAX; i++)
	{
		if(!flag[i])
		{
			prime[temp++] = i;
			for(int j = i; j <= MAX; j += i)
			{
				flag[j] =  true;
			}
		}
	}
	for(int i = 0; i < temp; i++)
	{
		printf("%d\t",prime[i]);
	}
	printf("\n");
}
int main()
{
	get_prime();
	return 0;
}
