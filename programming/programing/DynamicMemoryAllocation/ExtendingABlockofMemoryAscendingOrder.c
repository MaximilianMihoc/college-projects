/*
    program to make ascending order for a block of memory and for an extending of this block
*/
#include<stdio.h>
#include<stdlib.h>
main ()
{
    int *ptr;
    int no_els,no_bytes,i,j,aux;

    printf("Enter the number of elements\n");
    scanf("%d",&no_els);

    //calculate the number of bytes required
    no_bytes=no_els*sizeof(int);

    //Allocate the memory
    ptr=(int*)malloc(no_bytes);

    if(ptr==NULL)
    {
        printf("cannot allocate the memory\n");
    }
    else
    {
        //enter the numbers
        for(i=0;i<no_els;i++)
        {
            printf("enter element %d: ",i);
            scanf("%d",ptr+i);
        }

        printf("the numbers are:\t");
        for(i=0;i<no_els;i++)
        {
            printf("%d ",*(ptr+i));
        }

        for(i=0;i<no_els-1;i++)
        {
            for(j=i+1;j<no_els;j++)
            {
                if(*(ptr+i)>*(ptr+j))
                {
                    aux=*(ptr+i);
                    *(ptr+i)=*(ptr+j);
                    *(ptr+j)=aux;
                }
            }
        }

        printf("\n\nAscending order is:\t");
        for(i=0;i<no_els;i++)
        {
            printf("%d ",*(ptr+i));
        }

        ptr=realloc(ptr,(no_els+5)*sizeof(int));

        if(ptr==NULL)
        {
            printf("not possible to extend memory");
        }
        else
        {
            for(i=0;i<no_els+5;i++)
            {
                printf("\nenter element %d: ",i);
                scanf("%d",ptr+i);
            }

            printf("the numbers from extended block:\t");
            for(i=0;i<no_els+5;i++)
            {
                printf("%d ",*(ptr+i));
            }

            for(i=0;i<no_els+4;i++)
            {
                for(j=i+1;j<no_els+5;j++)
                {
                    if(*(ptr+i)>*(ptr+j))
                    {
                        aux=*(ptr+i);
                        *(ptr+i)=*(ptr+j);
                        *(ptr+j)=aux;
                    }
                }
            }

            printf("\n\nAscending order for extended block is:\t");
            for(i=0;i<no_els+5;i++)
            {
                printf("%d ",*(ptr+i));
            }
        }//end inner else

        //free to allocated memory
        free(ptr);
    }//end outer else
    getchar();
    getchar();
}//end main()

