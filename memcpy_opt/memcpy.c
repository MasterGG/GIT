#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<time.h>
void memcpy_unloop(char *src,char *des,int len)
{
	int i;
	int temp;
	temp = len % 4;
	len -= temp;
	for(i = 0; i < len; i += 4)
	{

                des[i] = src[i];	
                des[i+1] = src[i+1];
                des[i+2] = src[i+2];
                des[i+3] = src[i+3];
        }

	for(i = 0; i < temp; i++)
	{
		des[len+i] = src[len+i];
	}	
}

void memcpy_word(char *src,char *des,int len)
{
	int dev;
	int rest;
	int de,i,rr;
	unsigned long des1;
	
	des1 = (long)des;
	de = sizeof(unsigned long);    //word bit length
	len -= (-des1) % de;
	rr = (-des1) % de;
	while(rr > 0)
	{
		*((char *)des) = *((char *)src);
		des++;
		src++;
		rr--;
	}
	len -= rr;	
	dev = len / de;
	rest = len % de;		
	for(i = 0;i < dev;i++)
	{
		*((unsigned long *)des) = *((unsigned long*)src);
		src += de;
		des += de;
	}
	while(rest>0)
	{
		*((char *)des)= *((char *)src);
		des++;
		src++;
		rest--;
	}
}
/*did not optimized memcpy*/
void _memcpy(char *src,char *des,int len)
{
	int i;
	while(len)
	{
		*src++ = *des++;
		len--;
	}
}
void data_create(int n)
{
	int i;
        srand((unsigned)time(0));
        int *a = (int *)malloc(sizeof(int)*n);
        char *ch = (char *)malloc(sizeof(char)*n);
        FILE *fp = NULL;

        if(!a||!ch)
        {
                printf("create array failed!\n");
                exit(1);
        }

        fp=fopen("input_data.txt","w+");
        if(!fp)
        {
                printf("open file failed!\n");
                exit(1);
        }

        for(i = 0;i<n;i++)
        {
                a[i] = rand() % 26;
                ch[i] = a[i] + 97;
                fputc(ch[i],fp);
        }
        free(a);
        free(ch);
	a = NULL;
        ch = NULL;
        fclose(fp);
        fp = NULL;
}
int main()
{
	int N;
	int i;
	FILE *fp = NULL;
	clock_t start,end;		
	char temp;	

	printf("input the length of string:\n");
	scanf("%d",&N);
	while(N != EOF)	
	{
		i=0;
		char *ch1 = (char *)malloc(sizeof(char)*N);
		char *ch2 = (char *)malloc(sizeof(char)*N);
		char *ch3 = (char *)malloc(sizeof(char)*N);
		char *ch4 = (char *)malloc(sizeof(char)*N);
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
		printf("memcpy_unloop cost:%d us!\n",(int)(end-start));
		
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
		start = clock();
		_memcpy(ch1,ch4,N);
		end = clock();
	//	if(strcmp(ch1,ch3))
	//	{
	//		printf("memcpy is fault!\n");
	//		exit(1);
	//	}
		printf("memcpy cost:%d us!\n",(int)(end-start));
		
		/*clean data*/
		free(ch1);
		free(ch2);
		free(ch3);
		free(ch4);
		fclose(fp);
		fp = NULL;
		ch1 = NULL;
		ch2 = NULL;
		ch3 = NULL;
		ch4 = NULL;
		printf("input the length of string>>");
		scanf("%d",&N);
	}
	return 0;
}

