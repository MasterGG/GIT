#include <stdio.h>

int islandPerimeter(int** grid, int gridRowSize, int gridColSize) 
{
        int sum = 0;
	int i, j;
	int temp[gridRowSize][gridColSize];
	for(i = 0; i < gridRowSize; i++)
        {
		for(j = 0; j < gridColSize; j++)
		{
			temp[i][j] = *(grid++);
			printf("%d\t",temp[i][j]);
		}
		printf("\n");
	}
	for(i = 0; i < gridRowSize; i++)
        {
		for(j = 0; j < gridColSize; j++)
		{
			int flag = 0;
			if(temp[i][j] == 1)
			{
				if((i-1) >= 0 && temp[i-1][j]==1)
				{
					flag++;
				}
				if((j-1) >= 0 && temp[i][j-1]==1)
				{
					flag++;
				}
				if((i+1) < gridRowSize && temp[i+1][j]==1)
				{
					flag++;
				}
				if((j+1) < gridColSize && temp[i][j+1]==1)
				{
					flag++;
				}
				sum += (4 - flag);
			}
		}
	}
	return sum;
	
}
int main()
{
	int dd[][4]= {{0,1,0,0},{1,1,1,0},{0,1,0,0},{1,1,0,0}};
	int re;
	re = islandPerimeter(*dd, 4, 4);
	printf("%d \n", re);
	return 0;
}
