#include <string.h>
#include <time.h>
#include <wmmintrin.h> 
#include <emmintrin.h> 
#include <smmintrin.h> 
#include <stdint.h> 
#include <stdio.h>
#include <time.h>
#define __USE_GNU
#define _GNU_SOURCE
#include <sched.h>
#include <sys/time.h>
#include <stdlib.h>
#define CORE_NUMBER 3 
#define check 0 
typedef struct KEY_SCHEDULE { 
	 unsigned char KEY[16*15]; 
	unsigned int nr; 
} AES_KEY;
void AES_128_Key_Expansion (const uint8_t *userkey, AES_KEY *key);
int AES_GCM_decrypt (const unsigned char *in, 
	unsigned char *out, 
	const unsigned char* addt, 
	const unsigned char* ivec, 
	unsigned char *tag, 
	int nbytes, int abytes, int ibytes, 
	const unsigned char* key, 
	int nr); 
void AES_GCM_encrypt(const unsigned char *in, unsigned char *out, const unsigned char* addt, const unsigned char* ivec, unsigned char *tag, int nbytes, int abytes, int ibytes, const unsigned char* key, int nr); 
static void RAND_bytes(unsigned char *dst,int n)
{
	static int first = 1;
	if(first)
	{
		srand(time(0));
		first = 0;
	}
	for(int i=0;i<n;i++)
	{
		dst[i] = rand()%256;
	}
	return;
}
double time_substract(struct timeval *begin,struct timeval *end)
{
	return (end->tv_sec - begin->tv_sec)+(end->tv_usec - begin->tv_usec)/1000000.0;
}

int main()
{
	cpu_set_t mask;
	/* CPU_ZERO initializes all the bits in the mask to zero. */
	CPU_ZERO( &mask );
	/* CPU_SET sets only the bit corresponding to cpu. */
	CPU_SET( CORE_NUMBER, &mask );
	/* sched_setaffinity returns 0 in success */
	if( sched_setaffinity( 0, sizeof(mask), &mask ) == -1 )
	{
		printf("WARNING: Could not set CPU Affinity, continuing...\n");
	}
	printf("== core binding ==\n  binding to core %d ...\n\n", CORE_NUMBER);


	struct timeval s1,s2,s3;
	int N = 1440*1024*1024;
//	int M = 20;
	int M = 12;
	int I = 12;
	//1G Bytes data
	uint8_t* P = (uint8_t*)malloc(N);
	uint8_t* C = (uint8_t*)malloc(N);
	uint8_t* DECRYPTED_TEXT = (uint8_t*)malloc(N);
	__m128i T;
	RAND_bytes((uint8_t *)P, N);
	uint8_t K[16]={0xfe,0xff,0xe9,0x92,0x86,0x65,0x73,0x1c,0x6d,0x6a,0x8f,0x94,0x67,0x30,0x83,0x08};
	uint8_t IV[12]={0xca,0xfe,0xba,0xbe,0xfa,0xce,0xdb,0xad,0xde,0xca,0xf8,0x88}; 
//	uint8_t A[20]={0xfe,0xed,0xfa,0xce,0xde,0xad,0xbe,0xef,0xfe,0xed,0xfa,0xce,0xde,0xad,0xbe,0xef,0xab,0xad,0xda,0xd2}; 
	uint8_t A[12]={0xfe,0xed,0xfa,0xce,0xde,0xad,0xbe,0xef,0xfe,0xed,0xfa,0xce};
	AES_KEY key; 
	gettimeofday(&s1,0);
	AES_128_Key_Expansion (K, key.KEY); 
	key.nr = 10; 
	for(int i=0;i<N;i+=1440)
	{
		AES_GCM_encrypt(P+i, C+i, A, IV, &T, 1440, M, I, key.KEY, key.nr); 
#if check
		if(AES_GCM_decrypt(C+i, DECRYPTED_TEXT+i, A, IV, &T, 1440, M, I, key.KEY, key.nr)!=1)
		{
			printf("decrypt failed!\n");
			printf("%d\n",i);
			return -1;
		}
		for(int j=i; j<i+1440; j++)
			if(P[j]!=DECRYPTED_TEXT[j])
			{
				printf("decrpt data is not equal to the original data! %d\n",i);
				return;
			}
	}
	printf("decrpt data is equal to the original data\n");
#else
	}
	gettimeofday(&s2,0);
	double t1 = time_substract(&s1,&s2);
	printf("  Total time : %lf s\n",t1);
	printf("  Speed of encryption: %lf Gbps\n",(8.0*N/t1)/1024/1024/1024);
#endif
}
