#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

void memcpy_unloop(char *src, char *des, int len);
void memcpy_word(char *src, char *des, int len);
void data_create(int len);
void memcpy_neon(char *src, char *des, int len);

int main()
{
        int N;
        int i;
        FILE *fp = NULL;
        clock_t start,end;
        char temp;
	
        printf("input the length of string:\n");
        scanf("%d",&N);
	
	char *ch1 = (char *)malloc(sizeof(char)*N);
	char *ch2 = (char *)malloc(sizeof(char)*N);
	char *ch3 = (char *)malloc(sizeof(char)*N);
	char *ch4 = (char *)malloc(sizeof(char)*N);
	char *ch5 = (char *)malloc(sizeof(char)*N);
	/*get deferent address*/
	
	data_create(N);
	fp = fopen("input_data.txt","r+");
	if(!fp)
	{
		printf("open file failed!\n");
		exit(1);
	}
	temp = fgetc(fp);
	while(temp != EOF)
	{
		ch1[i++] = temp;
		temp = fgetc(fp);
	}
/*--------memcpy_unloop test running time--------*/
	start = clock();
	memcpy_unloop(ch1,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(ch1[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop cost:%d us!\n",(int)(end-start));
/*--------memcpy_word test running time--------*/
	start = clock();
	memcpy_word(ch1,ch3,N);
	end = clock();
	for(i = 0;i < N;i++)
	{
		if(ch1[i] != ch3[i])
		{
			printf("memcpy_word is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_word cost:%d us!\n",(int)(end-start));

/*-----------memcpy_neon test running time--------*/
	start = clock();
	memcpy_neon(ch1, ch5, N);
	end = clock();
	for(i = 0;i < N;i++)
	{
		if(ch1[i] != ch5[i])
		{
			printf("memcpy_neon is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_neon cost:%d us!\n",(int)(end-start));
/*-----------memcpy test running time------------*/
	start = clock();
	memcpy(ch4, ch1, N);
	end = clock();
	printf("memcpy cost:%d us!\n",(int)(end-start));

	/*clean data*/
	free(ch1);
	free(ch2);
	free(ch3);
	free(ch4);
	free(ch5);
	fclose(fp);
	fp = NULL;
	ch1 = NULL;
	ch2 = NULL;
	ch3 = NULL;
	ch4 = NULL;
	ch5 = NULL;
        return 0;
}

