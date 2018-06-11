#include <iostream>
#include <unordered_map>
#include <string>
using namespace std;

int main(int argc, char **argv) {
	unordered_map<int,string> map;
	map.insert(std::pair<int, string>(1, "Scala"));
	map.insert(std::pair<int, string>(2, "Java"));
	map.insert(std::pair<int, string>(3, "C++"));
	map.insert(std::pair<int, string>(6, "Java"));
	map.insert(std::pair<int, string>(14, "Erlang"));
	unordered_map<int, string>::iterator it;
	for(it = map.begin(); it != map.end(); ++it) {
		cout << it->first<<"/t"<<it->second <<endl;
	}
	return 0;
}
