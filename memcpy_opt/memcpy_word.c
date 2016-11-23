
void memcpy_word(char *src,char *des,int len)
{
        int dev;
        int rest;
        int de,i,rr;
        unsigned long des1;

        des1 = (long)des;
        de = sizeof(unsigned long);    //word bit length
        len -= (-des1) % de;
        rr = (-des1) % de;
        while(rr > 0)
        {
                *((char *)des) = *((char *)src);
                des++;
                src++;
                rr--;
        }
        len -= rr;      
        dev = len / de;
        rest = len % de;                
        for(i = 0;i < dev;i++)
        {
		*((unsigned long *)des) = *((unsigned long*)src);
                src += de;
                des += de;
        }
        while(rest>0)
        {
                *((char *)des)= *((char *)src);
                des++;
                src++;
                rest--;
        }
}

