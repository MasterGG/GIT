
#define ULONG unsigned long

void memcpy_word(char *src,char *des,int len)
{
	unsigned long des1, src1;
	int word;
	des1 = (ULONG)des;
	src1 = (ULONG)src;
	word = sizeof(ULONG);

//	printf("word=%d\n ",word);
//	printf("src=%p	src1=%d\n", src, src1);
//	printf("des=%p	des1=%d\n", des, des1);
	
	/*align the des1tination address*/
	while((des1%word) != 0 && len != 0)
	{
		*(char*)des1 = *(char*)src1;
		des1++;
		src1++;
		len--;
	}
	
	if(src1%word == 0)
	{
	
		/*if source address is align*/
		while(len >= 8)
		{
			*(ULONG*)des1 = *(ULONG*)src1;
			src1 += word;
			des1 += word;
			len -= word;
		}
		while(len > 0)
		{
			*(char*)des1 = *(char*)src1;
                        des1++;
                        src1++;
                        len--;

		}
	}
	/*source address is unaligned*/
	else 	
	{
		while(len >= word)
		{
			int shl, shr;
			shl = 8*(src1%word);
			shr = 8*word - shl;
			ULONG templ, temph, temp;
			src1 -= (shl/8); 
			templ = *(ULONG*)src1;
			temph = *((ULONG*)src1+1);
			temp = (templ>>shl)|(temph<<shr);
			
			*(ULONG*)des1 = temp;
			src1 += word;
			des1 += word;
			len -= word;
		}
		while(len > 0)
		{
			*(char*)des1 = *(char*)src1;
			des1++;
			src1++;
			len--;
		}	
	}

}

