/*************************************************************************
	> File Name: lz_77.c
	> Author: masterchen
	> Mail: csr@mail.ustc.edu.cn
	> Created Time: 2016年04月29日 星期五 11时01分47秒
 ************************************************************************/

#include<math.h>
#include<stdio.h>
#include<string.h>
#include<time.h>
#include<stdlib.h>

char* ten_To_n(int a,int n,int len);
char* lz_77(int a[],int size,int Ls,int n,int base)
{
	int B[n];
	int j=0;
	int i;
	for(i=0;i<n;i++)
	{
		if(i<n-Ls)
			B[i]=0;
		else
			B[i]=a[j++];
	}
	int L1=(int)ceil(log(n-Ls)/log(base));//向上取整数
	int L2=(int)ceil(log(Ls)/log(base));
//	printf("L2 is %d\n",L2);
	int k=0;
	int maxlen=0;
	int P;
    char *temp;
	char *c1,*c2,c3,*C;
	C=(char*)malloc(L1+L2+1);
   // printf("C length is %zu\n",sizeof(C));
   // printf("size=%d\n",size);
	while(k!=size)//源文件没有读完
	{

//		printf("k=%d\n",k);
		int len;
		int l;
		P=0;
		for(i=0;i<n-Ls;i++)
		{
			j=i;
			l=k;
			len=0;
	//		printf("i=%d\n",i);
    //        printf("l=%d\n",l);
			while(B[j]==a[l]&&l<Ls+k)
			{
				j++;
				l++;
	//			printf("j=%d\n",j);
				len++;
				if(len>maxlen)
				{
					maxlen=len;
					P=i;
				}
				if(l==n)
					break;
	//			printf("maxlen=%d\n",maxlen);
			}
	//		printf("maxlen=%d\n",maxlen);
		}
	//	printf("p=%d maxlen=%d\n",P,maxlen);
		c1=ten_To_n(P-1,base,L1);
		c2=ten_To_n(maxlen-1,base,L2);
	  //  printf("%s\n",c1);
		c3=a[k+maxlen]-'0';
		int f;
		C=strcat(c1,c2);
		f=strlen(C);
		C[f]=c3;
		C[f+1]='\0';
		k+=maxlen;
 //       printf("%s\n",C);
		j=k;
		for(i=0;i<n;i++)
		{
			if(i<n-maxlen)
			B[i]=B[maxlen+i];
			else
				B[i]=a[j++];
		}
	}
	return C;
}
char* ten_To_n(int a,int n,int len)
//十进制转换为n进制,且指定长度为len，不足补零
{
	char *b;
	b=(char*)malloc(len);
	int cons;//商
	int rem;//余数
	int i,j;
//	rem=a; 
	i=0;
	while(a!=0)
	{
		cons=a/n;
		rem=a%n;
		a=cons;
		if(cons<10)
		    b[i++]=(char)cons-'0';
		else
		    b[i++]=cons-10+'a';	
	}
	j=len-i;
	if(j!=0)
	{
		for(i=len-1;i>=0;i++)
		{	if(i>len-j)
		    	b[i]=b[i-j];
			else
				b[i]=0;
		}
	}
	return b;
}
int main()
{
	int *a;
	a=(int*)malloc(sizeof(int)*50);
	char *temp;
	int i;
	srand((unsigned)time(NULL));
	for(i=0;i<50;i++)
		a[i]=rand()%10;
    printf("before compress:\n");
	for(i=0;i<50;i++)
    {
		printf("%d ",a[i]);
	}
	printf("\n");
    temp=(char *)lz_77(a,50,10,20,10);
	printf("after compressed:\n");
	for(i=0;i<sizeof(temp);i++)
       printf("%c \n",temp[i]);
    printf("\n");
	return 0;
}
