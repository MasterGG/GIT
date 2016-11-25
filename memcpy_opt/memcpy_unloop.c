
void memcpy_unloop(char *src,char *des,int len)
{
        int i;
        int temp;
        temp = len % 8;
        len -= temp;
        for(i = 0; i < len; i += 8)
        {

                des[i] = src[i];
                des[i+1] = src[i+1];
                des[i+2] = src[i+2];
                des[i+3] = src[i+3];
		des[i+4] = src[i+4];
		des[i+5] = src[i+5];
		des[i+6] = src[i+6];
		des[i+7] = src[i+7];

        }

        for(i = 0; i < temp; i++)
        {
                des[len+i] = src[len+i];
        }
}
