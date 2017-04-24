#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int Size = 0;
int inRow(char *row, int length, char c)
{
	int i;
	for(i = 0; i < length; i++)
	{
		if(row[i] == c || row[i] == c + 32)
			return 1;
	}
	return 0;
}
char** findWords(char** words, int wordsSize) 
{
	    char a[10] = {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'};
	    char b[9] = {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'};
	    char c[7] = {'z', 'x', 'c', 'v', 'b', 'n', 'm'};
	    char **rows = (char**)malloc(sizeof(char *)*wordsSize);
	    int size = 0;
	    for(int i = 0; i < wordsSize; i++)
	    {
		    char *word = words[i];
		    int j = 0;
		    int row = 0;
		    int inOneRow = 1;
		    while(word[j] != '\0')
		    {
			    if(row == 0)
			    {
				    if(inRow(a, 10, word[j]))
				    {
				    	row = 1;
				//	continue;	
				    }
				    if(inRow(b, 9, word[j]))
				    {
					    row = 2;
				//	    continue;
				    }
				    if(inRow(c, 7, word[j]))
				    {
					    row = 3;
				//	    continue;
				    }
			    }
			    else
			    {
				    if((inRow(a, 10, word[j]) && row != 1) || (inRow(b, 9, word[j]) && row != 2) || (inRow(c, 7, word[j]) && row != 3))
				    {
					    inOneRow = 0;
					    break;
				    }
			    }
			    j++;
		    }
		    if(inOneRow)
		    {
			    rows[size] = word;
			    size++;
		    }
	    }
	    Size = size;
	    return rows;
}
int main()
{
	char *ch[7] = {"sdffgdfgdf","werrtr","cvdfr","tygfc","dad","qwe","gfdss"};
	int len;
	char **re;
	//int size = 0;
	printf("ssssss=%d\n", Size);
	re = findWords(ch, 7);
	printf("string length:%d\n ", Size);	
	for(int i = 0; i < Size; i++)
	{
		
		printf("%s\n", re[i]);

	}
	return 0;
}
