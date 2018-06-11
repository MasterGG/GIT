#include <iostream>
#include <string>
using namespace std;

string bigNumberadd(string s1, string s2)
{
	int cflag = 0;
	int tempnum, tempnum2, temp;
	int len = s1.size();
	int len2 = s2.size();
	int dis = len -len2;
	string s3(dis, '0');
	string res = s3+s2;
	string result(len + 1, '0');
	for(int i = len -1; i >=0; i--)
	{
		tempnum = s1[i] - '0';
		tempnum2 = res[i] -'0';
		temp = tempnum + tempnum2 + cflag;
		if(temp >= 10)
		{
			temp -= 10;
			cflag = 1;
			result[i + 1] = temp + '0';
		}	
		else
		{
			cflag = 0;
			result[i + 1] = temp + '0';
		}
	}
	if(cflag == 1)
	{
		result[0] = '1';
	}
	else result[0] = '0';
	return result;
}
int main()
{
	string s1 = "2345678901";
	string s2 = "12355332";
	string add;
	add = bigNumberadd(s1, s2);
	cout<<add<<endl;
	return 0;
}
