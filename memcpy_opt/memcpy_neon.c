#include <arm_neon.h>
#include <assert.h>

void memcpy_neon(char *src, char *des, int len)
{
	int8_t *src1 = (int8_t*)src;
	int8_t *des1 = (int8_t*)des;
	int8x16_t vec;
	int i;
	int temp = len % 16;
	int len1 = len - temp;
	char ch;
	/*use neon */
	for(i = 0; i < len1; i += 16)
	{
		vec = vld1q_s8(src1);
		vst1q_s8(des1, vec);
		src1 += 16;
		des1 =+ 16;
	}
	/*duplicate the rest characters*/
	while(temp != 0)
	{
		*(char*)des1 = *(char*)src1;
		des1++;
		src1++;
		temp--;	
	}
}
