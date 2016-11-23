#include<stdio.h>
#include<malloc.h>
#include<sys/time.h>
#include<memory.h>

#define SIZE_ULONG sizeof(unsigned long int)

char *strncpy(char *, const char *,size_t );

char* my_strncpy(char *,const char *,size_t);

void main(int argc, char * argv[])
{
	if(argc!=7){
		printf("./a.out <size> <dst offset> <src offset> <distance> <where is the \\0> <function>\n");
		return;
	}

	struct timeval start,end;
	unsigned long int time,time1,time2,x;
	int i,j;
	char* src;
	int n=atoi(argv[1]);
	int offset_dst=atoi(argv[2]);
	int offset_src=atoi(argv[3]);
	int distance=atoi(argv[4]);
	int where_0=atoi(argv[5]);
	int func=atoi(argv[6]);
	char* dst = (char*)malloc(sizeof(char)*n*5);
	memset(dst,'@',5*n);
	printf("初始地址:%lx   ",dst);
	if((unsigned long int)dst%SIZE_ULONG==0)
		printf("初始对齐\n");
	else 
		printf("初始非对齐\n");

	if(distance<0){
		src = dst;
		dst = src-distance;
	}else{
		src = dst+distance;
	}
	
	x=(unsigned long int)dst+offset_dst;
	printf("dst:%lx  ,偏移:%d \n",x,x%SIZE_ULONG);
	x=(unsigned long int)src+offset_src;
	printf("src:%lx  ,偏移:%d \n",x,x%SIZE_ULONG);
	
	char* p3= (char*)malloc(sizeof(char)*n*2);

	for(i=0;i<2*n;i++){
		p3[i]=src[i+offset_src]=i%25+65;
	}
	p3[where_0]=src[where_0+offset_src]='\0';


	for(j=0;j<n+5;j++){
		if(dst[offset_dst+j]!='\0')
			printf("%c ",dst[offset_dst+j]);
		else printf("0 ");
	}
	
	printf("\nsrc: ~%s~\n",src+offset_src);
	printf("p3:  ~%s~\n",p3);

	if(func==1){
		gettimeofday(&start,NULL);
		for(i=0;i<100;i++)
			my_strncpy(dst+offset_dst,src+offset_src,n);
		gettimeofday(&end,NULL);
		time=1000000*(end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
		printf("time:%ld us\n",time);
	}else if(func==2){
		gettimeofday(&start,NULL);
		for(i=0;i<100;i++)
			strncpy(dst+offset_dst,src+offset_src,n);
		gettimeofday(&end,NULL);
		time=1000000*(end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
		printf("time:%ld us\n",time);
	}else{
		gettimeofday(&start,NULL);
		my_strncpy(dst+offset_dst,src+offset_src,n);
		gettimeofday(&end,NULL);
		time1=1000000*(end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;

		for(j=0;j<n+5;j++){
			if(dst[offset_dst+j]!='\0')
				printf("%c ",dst[offset_dst+j]);
			else printf("0 ");
		}
		for(i=0;i<where_0;i++){
			if(dst[i+offset_dst]!=p3[i]){
				printf("error_0\n");
				for(j=0;j<n+5;j++){
					if(dst[offset_dst+j]!='\0')
						printf("%c ",dst[offset_dst+j]);
					else printf("0 ");
					return;
				}
			}
		}
		for(;i<n;i++){
			if(dst[i+offset_dst]!='\0'){
				printf("error\n");
				for(j=0;j<n+5;j++){
					if(dst[offset_dst+j]!='\0')
						printf("%c ",dst[offset_dst+j]);
					else printf("0 ");
					return;
				}
			}
		}
		printf("\n**************my copy correct************\n");

		gettimeofday(&start,NULL);
		strncpy(dst+offset_dst,src+offset_src,n);
		gettimeofday(&end,NULL);
		time2=1000000*(end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
		printf("time1:%ld us\ntime2:%ld us\n",time1,time2);
		printf("%f\n",(time2-time1)/(double)time2);
	}

	return;
}

