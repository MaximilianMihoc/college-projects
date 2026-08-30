#include<stdio.h>
#include<string.h>

#define LEN1 5
#define LEN2 4
#define LEN3 3

struct student_rec
{
    char studentNumber [10];
    char name[20];
    int year;
    char college[4];
    char previousCol[6];
};

struct student_rec getDetails(char [], char[], int, char[], char[]);

main()
{
    int LEN4 = LEN1 + LEN2 + LEN3;
    struct student_rec dit[LEN1], itt[LEN2], itb[LEN3], tu[LEN4];
    int i=0, j=0, m=0, k=-1;

    dit[0] = getDetails ("C19897386", "Eduard Mihoc      ", 1, "DIT", "ITT");
    dit[1] = getDetails ("C15499895", "Florin Ghiuzan    ", 3, "DIT", "ITB");
    dit[2] = getDetails ("C12728559", "Maximilian Mihoc  ", 1, "DIT", "none");
    dit[3] = getDetails ("C18564946", "Petrica Horlescu  ", 4, "DIT", "none");
    dit[4] = getDetails ("C18465977", "Valentin Ciustea  ", 1, "DIT", "ITT");

    itt[0] = getDetails ("C45412356", "Antonela Mihoc    ", 3, "ITT", "ITB");
    itt[1] = getDetails ("D54659754", "Codrin Munteanu   ", 1, "ITT", "DIT");
    itt[2] = getDetails ("A98452135", "Cosmin Stefanica  ", 1, "ITT", "none");
    itt[3] = getDetails ("D12479354", "Popovici Georgiana", 4, "ITT", "none");

    itb[0] = getDetails ("C21655988", "Ionut Marin       ", 2, "ITB", "none");
    itb[1] = getDetails ("D87456541", "Maximilian Mare   ", 3, "ITB", "ITT");
    itb[2] = getDetails ("C75546324", "Petrica Horlescu  ", 1, "ITB", "none");

/******************************* Part 1 *********************************************/

    while (i < LEN1 && j < LEN2 && m < LEN3)
    {
        if(strcmp(dit[i].name, itt[j].name) < 0)
        {
            if(strcmp(dit[i].name, itb[m].name) < 0)
            {
                tu[++k] = dit[i++];
            }
            else
            {
               tu[++k] = itb[m++];
            }
        }
        else
        {
            if(strcmp(itt[j].name, itb[m].name) < 0)
            {
                tu[++k] = itt[j++];
            }
            else
            {
                tu[++k] = itb[m++];
            }
        }
    } //end while

    while (i < LEN1 && j < LEN2)
    {
        if(strcmp(dit[i].name, itt[j].name) < 0)
        {
            tu[++k] = dit[i++];
        }
        else
        {
            tu[++k] = itt[j++];
        }
    }

    while (i < LEN1 && m < LEN3)
    {
        if(strcmp(dit[i].name,itb[m].name) < 0)
        {
            tu[++k] = dit[i++];
        }
        else
        {
            tu[++k] = itb[m++];
        }
    }

    while (j < LEN2 && m < LEN3)
    {
        if(strcmp(itt[j].name,itb[m].name) < 0)
        {
            tu[++k] = itt[j++];
        }
        else
        {
            tu[++k] = itb[m++];
        }
    }

    while (i < LEN1)
    {
        tu[++k] = dit[i++];
    }

    while (j < LEN2)
    {
        tu[++k] = itt[j++];
    }

    while (m < LEN3)
    {
        tu[++k] = itb[m++];
    }

    printf("\nStudentNR  Name               year College previousCollege\n\n");
    for(i=0; i <= k; i++)
    {
        printf("\n%s  %s  %d     %s        %s",tu[i].studentNumber, tu[i].name, tu[i].year, tu[i].college,tu[i].previousCol);
    }

/******************************* Part 2 *********************************************/

    char choice = 'n';
    printf("\n\nWould you like to search for students that was in ITT and are now in DIT(Y/N)?\n");
    scanf("%c",&choice);
    if(choice == 'y' || choice == 'Y')
    {
        printf("\nThe students are: ");
        for(i=0; i < LEN4; i++)
        {
            if (strcmp(tu[i].previousCol,"ITT") == 0 && strcmp(tu[i].college,"DIT") == 0)
            {
                printf("\n\t%s",tu[i].name);
            }
        }
    }
    getchar();
    getchar();

}

struct student_rec getDetails(char num[], char n[], int x, char col[], char prvcol[])
{
    struct student_rec newStudent;
    strcpy(newStudent.studentNumber, num);
    strcpy(newStudent.name, n);
    newStudent.year = x;
    strcpy(newStudent.college, col);
    strcpy(newStudent.previousCol, prvcol);

    return newStudent;
}
