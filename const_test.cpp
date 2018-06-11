#include <stdio.h>
#include <iostream>
int main(int argc, char* argv[]){
	volitale const int b = 4;
	volatile int * pr;
	pr = b;
	std::cout<<b<<pr<<std::endl;
	pr = 5;
	std::cout<<b<<pr<<std::endl;
}
