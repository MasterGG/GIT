#include <stdio.h>
#include <math.h>
#include <vector>
using namespace std;
vector<int> twoSum(vector<int>& numbers, int target) {
	int len = numbers.size();
	vector<int> res;
	for(int i = 0; i < len-1;i++)
	{
		for(int j = i + 1; j < len; j++)
		{
			if(numbers[i] >= 0 && numbers[j] > target) 
			{
				len =j;
				break;            
			}
			int temp = target -numbers[i];
			if(numbers[j] == temp)  
			{
				res.push_back(i+1);
				res.push_back(j+1);
				return res;
			}
		}
	}
	return res;
}
int main()
{
	vector<int> kk;
	kk.push_back(0);
	kk.push_back(0);
	kk.push_back(3);
	kk.push_back(4);
	vector<int> res;
	res =twoSum(kk, 0);
//	cout<<res.size()<<std::endl;
	printf("res.size is:%d\n",res.size());
	printf("res[0] is:%d\n",res[0]);
	printf("res[1] is:%d\n",res[1]);
	return 0;
}
