/* Create a tree from stars(*)*/
#include<stdio.h>
main()
{
    int size, spaces, stars=1;
    int i;

    printf("\nEnter the size of tree\n");
    scanf("%d",&size);

    spaces=size-1;

    if(size==0 || size==1)
    {
        printf("cannot build a three");
    }
    else
    {

        while(spaces!=-1)
        {
            for(i=0;i<spaces;i++)
            {
                printf(" ");
            }

            for(i=0;i<stars;i++)
            {
                printf("*");
            }

            printf("\n");
            stars=stars+2;
            spaces=spaces-1;
        }

        if(spaces==-1)
        {
            for(i=0;i<size-1;i++)
            {
                printf(" ");
            }
            printf("*");
        }
    }
}
