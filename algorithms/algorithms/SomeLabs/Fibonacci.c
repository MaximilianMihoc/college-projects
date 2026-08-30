/*
    Program to calculate any term in fibonaccci
*/

#include<stdio.h>

int fib(int);

main ()
{
    int num;

    printf("Enter the term you want to find\n");
    scanf("%d",&num);

    printf("\nthe term is:%d\n",fib(num));
}
int fib(int num)
{
    if (num==0 || num==1)
    {
        return num;
    }
    else return(fib(num-1)+fib(num-2));
}
