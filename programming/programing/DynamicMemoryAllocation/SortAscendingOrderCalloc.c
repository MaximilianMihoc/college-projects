/*
    program to sort a block of memory in ascending order with calloc() function
*/
#include<stdio.h>
#include<stdlib.h>
main ()
{
    int *ptr;
    int no_els,i,j,aux;

    printf("Enter the number of elements\n");
    scanf("%d",&no_els);

    //Allocate the memory
    ptr=(int*)calloc(no_els,sizeof(int));

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
        //sort the elements
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
        //display the elements
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


