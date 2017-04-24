#include <stdio.h>
#include <stdlib.h>

int* nextGreaterElement(int* findNums, int findNumsSize, int* nums, int numsSize, int* returnSize)
{
	int* result = (int *)malloc(sizeof(int)*numsSize);
	int size = 0;
	for(int i = 0; i < findNumsSize; i++)
	{
	        int	flag = 0;
		int j = 0;
		for(j = 0; j < numsSize; j++)
		{
			if(findNums[i] == nums[j] && flag ==0)
			{
				flag = 1;
				continue;
			}
			
			if(findNums[i] <  nums[j] && flag == 1)
			{
				result[size] = nums[j];
				size++;
				break;
			}
			
		}
		if(j == numsSize)
		{
			result[size] = -1;
			size++;
		}
	}
	*returnSize = size;
	return result;
}
int main()
{
	int nums1[4] ={5,3,12,6};
	int nums2[7] = {1,5,2,6,3,4,12};
	int* re;
	int ss;
	re = nextGreaterElement(nums1, 4,nums2, 7, &ss);
	for(int i = 0; i < ss; i++)
	{
		printf("%d\t", re[i]);
	}
	printf("");
	printf("\n");
	return 0;
}
