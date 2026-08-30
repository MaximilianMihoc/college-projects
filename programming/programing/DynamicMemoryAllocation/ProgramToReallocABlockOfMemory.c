/* program to resize an allocated block of memory
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
        //display the content, the contents should be all initialised with zero
        for(i=0;i<no_els;i++)
        {
            printf("element %d is %.1f\n",i,*(ptr+i));
        }

        //change the size, make it bigger
        ptr=realloc(ptr,no_els*sizeof(float)*2);
        //I have doubled the size of the existing block
        if(ptr==NULL)
        {
            printf("not able to enlarge memory");
        }
        else
        {
            printf("the block of memory reallocated is:\n");
            for(i=0;i<no_els*2;i++)
            {
                printf("%.1f\n",*(ptr+i));
            }
        }

        //free to allocated memory
        free(ptr);
    }//end else
    getchar();
    getchar();
}//end main()

