/*************************************************************************
	> File Name: createfile.c
	> Author: masterchen
	> Mail: csr@mail.ustc.edu.cn
	> Created Time: 2016年04月24日 星期日 12时28分38秒
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<time.h>
int main()
{
   FILE *fp;
   unsigned char *p;	
   fp=fopen("test.txt","wb+");
   p=(char*)malloc(sizeof(char)*4096);
   int i,a;
   srand((unsigned)time(NULL));
   for(i=0;i<4096;i++)
   {
	   a=rand()%256;   
	   p[i]=a;
	   fwrite(&p[i],1,1,fp);
   }
   fclose(fp);
   printf("\n");
   return 0;
}
