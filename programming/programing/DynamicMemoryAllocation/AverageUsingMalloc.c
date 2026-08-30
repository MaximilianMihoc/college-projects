/*
    program to make the average of numbers using Malloc() function
*/
#include<stdio.h>
#include<stdlib.h>
main ()
{
    int *ptr;
    int no_els,no_bytes,i;

    printf("Enter the number of elements\n");
    scanf("%d",&no_els);

    //calculate the number of bytes required
    no_bytes=no_els*sizeof(int);

    //Allocate the memory
    ptr=(int*)malloc(no_bytes);

    int total=0;

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
        //display the numbers entered into the new memory block
        for(i=0;i<no_els;i++)
        {
            total+=*(ptr+i);
        }

        printf("the average is: %.2f",(float)total/no_els);
        //free to allocated memory
        free(ptr);
    }//end else
    getchar();
    getchar();
}//end main()

