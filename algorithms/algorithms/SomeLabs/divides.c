#include<stdio.h>
main ()
{
    int ans=0,x,y,div;

    printf("\nread div:");
    scanf("%d",&div);

    printf("\nread x:");
    scanf("%d",&x);

    if(x%div==0)
    {
        ans=x/div;
    }
    else
    {
        while(x%div!=0)
        {
            ans=ans*10+x/div;
            x=x%div;

            printf("\nread y:");
            scanf("%d",&y);

            x=x*10+y;
        }

        ans=ans*10+x/div;
    }

    printf("\nans=%d",ans);
}
