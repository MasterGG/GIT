#include<iostream>  
using namespace std;  

class A  
{  
	public:  
	void foo()  
	{  
		cout<<"1\n";  
	}  
	virtual void fun()  
	{  
		cout<<"2\n";  
	}  
};  
class B : public A  
{  
	public:  
	void foo()  
	{  
		cout<<"3\n";  
	}  
	void fun()  
	{  
		cout<<"4\n";  
	}  
};  
int main(void)  
{  
	A a;  
	B b;  
	A *p = &a;  
	p->foo();  
	p->fun();  
//	p = &b;  
	B *ptr = (B *)&a;
	ptr->foo(); 
       	ptr->fun();
//	p->foo();  
//	p->fun();  
    return 0;  
}  
