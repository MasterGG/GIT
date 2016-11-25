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
        while(N != EOF)
        {
                i=0;
                char *ch1 = (char *)malloc(sizeof(char)*N);
                char *ch2 = (char *)malloc(sizeof(char)*N);
                char *ch3 = (char *)malloc(sizeof(char)*N);
                char *ch4 = (char *)malloc(sizeof(char)*N);
                /*get deferent address*/
//		char *src1 = ch1 + 1;
//		char *src2 = ch1 + 2;
//		char *src3 = ch1 + 3;		
//		char *src4 = ch1 + 3;		
//		char *src5 = ch1 + 3;		
//		char *src6 = ch1 + 3;		
//		char *src7 = ch1 + 3;		
		
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
                memcpy(ch4, ch1, N);
                end = clock();
        //      if(strcmp(ch1,ch3))
        //      {
        //              printf("memcpy is fault!\n");
        //              exit(1);
        //      }
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

