#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

void memcpy_unloop(char *src, char *des, int len);
void memcpy_word(char *src, char *des, int len);
void data_create(int len);

int main()
{
        int N;
        int i;
        FILE *fp = NULL;
        clock_t start,end;
        char temp;
	
        printf("input the length of string:\n");
        scanf("%d",&N);
	i = 0;
	char *ch1 = (char *)malloc(sizeof(char)*N);
	char *ch2 = (char *)malloc(sizeof(char)*N);
	/*get deferent address*/
	char *src1 = ch1 + 1;
	char *src2 = ch1 + 2;
	char *src3 = ch1 + 3;		
	char *src4 = ch1 + 4;		
	char *src5 = ch1 + 5;		
	char *src6 = ch1 + 6;		
	char *src7 = ch1 + 7;		
	
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
	printf("memcpy_unloop is correct!\n");
	printf("0偏移：source address=%p	des address=%p\n", ch1, ch2);
	printf("0偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src1, ch1,N);
	start = clock();
	memcpy_unloop(src1,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(src1[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop is correct!\n");

	printf("1偏移：source address=%p	des address=%p\n", src1, ch2);
	printf("1偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src2, ch1,N);
	start = clock();
	memcpy_unloop(src2,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(src2[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop is correct!\n");
	printf("2偏移：source address=%p	des address=%p\n", src2, ch2);

	 printf("2偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src3, ch1,N);
	start = clock();
	memcpy_unloop(src3,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(src3[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop is correct!\n");
	printf("3偏移：source address=%p	des address=%p\n", src3, ch2);

	printf("3偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src4, ch1,N);
	start = clock();
	memcpy_unloop(src4,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(src4[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop is correct!\n");
	printf("4偏移：source address=%p	des address=%p\n", src4, ch2);
	printf("4偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src5, ch1,N);
	start = clock();
	memcpy_unloop(src5,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
//	for(i = 0;i < N;i++)
//	{
//		if(src5[i] != ch2[i])
//		{
//			printf("memcpy_unloop is fault!\n");
//			exit(1);
//		}
//	}
	if(strcmp(src5,ch2))
	{
		printf("memcpy_unloop is fault!\n");
		exit(1);
	}
	printf("memcpy_unloop is correct!\n");
	printf("5偏移：source address=%p	des address=%p\n", src5, ch2);
	printf("5偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src6, ch1,N);
	start = clock();
	memcpy_unloop(src6,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(src6[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop is correct!\n");
	printf("6偏移：source address=%p	des address=%p\n", src6, ch2);
	printf("6偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));
	memcpy(src7, ch1,N);
	start = clock();
	memcpy_unloop(src7,ch2,N);
	end = clock();

	/*judge the copyed data is correct*/
	for(i = 0;i < N;i++)
	{
		if(src7[i] != ch2[i])
		{
			printf("memcpy_unloop is fault!\n");
			exit(1);
		}
	}
	printf("memcpy_unloop is correct!\n");
	printf("7偏移：source address=%p	des address=%p\n", src7, ch2);
	printf("7偏移：memcpy_unloop cost:%d us!\n\n",(int)(end-start));

//	free(ch1);
//	free(ch2);
	fclose(fp);
	fp = NULL;
//	ch1 = NULL;
//	ch2 = NULL;
        return 0;
}

