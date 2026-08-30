/*
    Program to find if a year is a leap year or not

    In the Gregorian calendar 3 criteria must
    be taken into account to identify leap years:

    The year is evenly divisible by 4;
    -If the year can be evenly divided by 100, it is NOT a leap year, unless;
    -The year is also evenly divisible by 400. Then it is a leap year.
    -This means that 2000 and 2400 are leap years, while 1800, 1900,
    2100, 2200, 2300 and 2500 are NOT leap years.

    The year 2000 was somewhat special as it was the
    first instance when the third criterion was used in
    most parts of the world since the transition from the
    Julian to the Gregorian Calendar.
*/
#include<stdio.h>

main()
{
    int year;

    printf("\nEnter a year to find out if it is a leap year or not\n");
    scanf("%d",&year);

    if(year%400==0)
    {
        printf("\nLeap year");
    }
    else if(year%100==0)
    {
        printf("\nNot a Leap year");
    }
    else if(year % 4==0)
    {
        printf("\nLeap year");
    }
    else
    {
        printf("\nNot a Leap year");
    }
}
