#include <stdio.h>
int** matrixReshape(int** nums, int numsRowSize, int numsColSize, int r, int c, int* returnSize) 
{
	   if (r * c != numsRowSize * numsColSize) {
		   r = numsRowSize;
		   c = numsColSize;
	       }
	       *returnSize = r;
	   int** result = (int**) malloc(r * sizeof(int*));
	      // *columnSizes = (int*) malloc(r * sizeof(int));
	   for (int i = 0; i < r; ++i) {
			   result[i] = (int*) malloc(c * sizeof(int));
			   //(*columnSizes)[i] = c;
	       }
       for (int i = 0; i < numsRowSize * numsColSize; ++i)
	       result[i/c][i%c] = nums[i/numsColSize][i%numsColSize];
   return result;
}
int main()
{
	        int dd[][4]= {{0,1,0,0},{1,1,1,0},{0,1,0,0},{1,1,0,0}};
		int re; 
		printf("dd==%d\n",dd);
		int **temp;
		int* returnsize;
		temp = matrixReshape(dd, 4, 4, 2, 8, returnsize);
		for(int i = 0; i <2; i++)
		{
			for(int j = 0; j < 8; j++)
			{
				printf("%d\t",temp[i][j]);
			}
			printf("\n");
		}
		return 0;
}
