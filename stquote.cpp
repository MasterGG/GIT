#include <iostream>
#include <string>
using namespace std;

string version1(const string & s1, const string & s2);
const string & version2(string & s1, const string & s2);
const string & version3(string & s1, const string & s2);

int main()
{
	string input;
	string copy;
	string result;

	cout<<"enter a string:";
	getline(cin, input);
	copy= input;
	cout<<"your string as entered: "<<input<<endl;
	result = version1(input, "***");
	cout<<"your string enhanced: "<<result<<endl;
	cout<<"your original string: "<<input<<endl;

	result = version2(input, "###");
	cout<<"your string enhanced: "<<result<<endl;
	cout<<"your stirng original: "<<input<<endl;
	cout<<"resetting original string.\n";
	input = copy;
	cout<<"resetting original string.\n"<<input<<endl;
	result = version3(input, "@@@");
	cout<<"your string enhanced: "<<result<<endl;
	cout<<"your original string: "<<input<<endl;
	return 0;
}
string  version1(const string & s1, const string & s2)
{
	string temp;
	temp = s2+s1+s2;
	return temp;
}
const string & version2(string & s1, const string & s2)
{
	s1 = s2+s1+s2;
	return s1;
}
const string & version3(string & s1, const string & s2)
{
	string temp;
	temp = s2+s1+s2;
	return temp;
}
