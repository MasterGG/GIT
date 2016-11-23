
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
