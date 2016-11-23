#include <string.h>

#define LEN_LIMIT 16
#define DEF(X) (((X) - 0x0101010101010101LL) & ~(X) & 0x8080808080808080LL)

char *my_strncpy(char* to, const char * from, size_t length)
{
	unsigned long int p1 = (unsigned long int)to;
	unsigned long int p2 = (unsigned long int)from;
	size_t n = length;
	if(n>LEN_LIMIT)
	{
		/*先对齐p1*/
		while(p1 % sizeof(unsigned long int)!=0){
			*(unsigned char*)p1 = *(unsigned char*)p2;
			n--;
			if((*(unsigned char*)p1)=='\0')
				goto zero_fill;	
			p1++;
			p2++;
		}

		size_t n2=n /sizeof(unsigned long int);
		unsigned long int x;
		if(p2 % sizeof(unsigned long int)==0)
		{//p2对齐
			while(n2){
				x = *(unsigned long int*)p1 = *(unsigned long int*)p2;
				if(DEF(x))
					break;
				p1 +=sizeof(unsigned long int);
				p2 +=sizeof(unsigned long int);
				n2--;
			}	
		}else
		{//p2非对齐
			int shl = 8*(p2 % sizeof(unsigned long int));
			int shr = 8*(sizeof(unsigned long int))-shl;
			p2 &= -sizeof(unsigned long int);
			unsigned long int a0,a1;
			while(n2){
				a0 = *(unsigned long int*)p2;
				a1 = *((unsigned long int*)p2+1);
				x = (a0>>shl)|(a1<<shr); 	
				*(unsigned long int *)p1 = x;
				if(DEF(x))
					break;
				p1 +=sizeof(unsigned long int);
				p2 +=sizeof(unsigned long int);
				n2--;
			}	
			p2 += shl/8;
		}

		n = n % sizeof(unsigned long int) + n2 * sizeof(unsigned long int);
	}

	while(n){
		*(unsigned char*)p1 = *(unsigned char*)p2;
		n--;
		p2++;
		if((*(unsigned char*)p1++)=='\0')
			goto zero_fill;	
	}

zero_fill:
	while(n){
		*(unsigned char*)p1 = '\0';
		n--;
		p1++;
	}

	return to;
}


