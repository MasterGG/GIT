#include <stdio.h>
#include <stack>
#include <stdlib.h>
#include <iostream>

struct Linknode
{
	int value;
	Linknode* next;
};

//void initList(Linknode* phead)
//{
//	*phead = NULL;
//}

void PrintLinklist_reversely(Linknode **phead)
{
	std::stack<Linknode*> nodes;
	Linknode* temp = (*phead) -> next;
	while(temp != NULL)
	{
		
		nodes.push(temp);
		temp = temp->next;
	}
	while(!nodes.empty())
	{
		temp = nodes.top();
		printf("%d\t",temp->value);	
		nodes.pop();
	}
}

int main()
{
	Linknode** head;
	*head = (Linknode*)malloc(sizeof(Linknode));
	(*head) -> next = NULL;
	printf("head->value=%d\n", (*head) -> value);
	Linknode* ptail = *head;
	for(int i = 0; i < 10; i++)
	{
		Linknode* temp = (Linknode*)malloc(sizeof(Linknode));
		temp->value = i;
		temp ->next = NULL;
		ptail->next = temp;	
		ptail = ptail->next;
	}
	ptail = *head;
	while(ptail->next != NULL)
	{
		printf("%d\t",ptail->next->value);
		ptail = ptail->next;
	}
	std::cout<<std::endl;
	PrintLinklist_reversely(head);
	printf("\n");
	return 0;
}
