void data_create(int n)
{
        int i;
        srand((unsigned)time(0));
        int *a = (int *)malloc(sizeof(int)*n);
        char *ch = (char *)malloc(sizeof(char)*n);
        FILE *fp = NULL;

        if(!a||!ch)
        {
                printf("create array failed!\n");
                exit(1);
        }

        fp=fopen("input_data.txt","w+");
        if(!fp)
        {
                printf("open file failed!\n");
                exit(1);
        }

        for(i = 0;i<n;i++)
        {
                a[i] = rand() % 26;
                ch[i] = a[i] + 97;
                fputc(ch[i],fp);
        }
        free(a);
        free(ch);
        a = NULL;
	ch = NULL;
        fclose(fp);
        fp = NULL;
}

