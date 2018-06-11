#include <stdio.h>
#include <>

struct linkNode
{
	int val;
	int* next;
};

linkNode* mergeLinknode(linkNode* l1, linkNode* l2)
{
	linkNode* ne1, ne2;
	linkNode* t1, t2;
	ne1 = l1;
	ne2 = l2;
	t1 = ne1 ->next;
	t2 = ne2 ->next;
	linkNode* re = NULL;
	if(ne1->val > ne2->val)
	{
		re = ne2;
		re ->next = ne1;
	}
	else
	{
		re = ne1;
		re ->next = ne2;
	}
}
