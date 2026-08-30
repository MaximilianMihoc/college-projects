/*
    program to show the use of Calloc() function
*/
#include<stdio.h>
#include<stdlib.h>
main ()
{
    float *ptr;
    int no_els,i;

    printf("Enter the number of elements\n");
    scanf("%d",&no_els);

    //Allocate the memory
    ptr=(float*)calloc(no_els,sizeof(float));

    //check if memory alocated succesfully
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
            scanf("%f",ptr+i);
        }
        //display the numbers entered into the new memory block
        for(i=0;i<no_els;i++)
        {
            printf("element %d is %.1f\n",i,*(ptr+i));
        }
        //free to allocated memory
        free(ptr);
    }//end else
    getchar();
    getchar();
}//end main()
