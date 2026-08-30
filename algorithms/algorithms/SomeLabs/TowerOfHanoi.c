/*
    Tower of Hanoi problem
*/

#include<stdio.h>

void moveTower(int,int,int,int);

main()
{
    int disks;
    int dest,source,spare;

    printf("Enter the number of disks\n");
    scanf("%d",&disks);

    printf("Enter the source\n");
    scanf("%d",&source);

    printf("Enter the destination\n");
    scanf("%d",&dest);

    printf("Enter the spare\n");
    scanf("%d",&spare);

    moveTower(disks,source,dest,spare);
}
int move=0;
void moveTower(int disks,int source,int dest,int spare)
{
    if(disks==0)
    {
        printf("move:%d disk:%d from tower %d to tower %d\n",++move,disks,source,dest);
    }
    else
    {
        moveTower(disks-1,source,spare,dest);
        printf("move:%d disk:%d from tower %d to tower %d\n",++move,disks,source,dest);
        moveTower(disks-1,spare,dest,source);
    }
}

