/*
    program to sort a block of memory in ascending order with malloc() function
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

        //free to allocated memory
        free(ptr);
    }//end else
    getchar();
    getchar();
}//end main()

