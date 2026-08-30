/*  
	HangMan Game
*/
#include<stdio.h>
#include<time.h>
#include<stdlib.h>

#define LENGHTARRAY0 8
#define LENGHTARRAY1 10
#define LENGHTARRAY2 12
#define LENGHTARRAY3 9
#define LENGHTARRAY4 11

main()
{
    char play,letter,p;
    int continu,lenghtletters,i,r,j,lives,ok,count,n,lenght,must;
    char letters[LENGHTARRAY2],c[LENGHTARRAY2],d[LENGHTARRAY2];
    // initialising the 5 words for guess
    char array0[LENGHTARRAY0]={'A','B','R','O','G','A','T','E'};
    char array1[LENGHTARRAY1]={'B','I','T','T','E','R','N','E','S','S'};
    char array2[LENGHTARRAY2]={'O','V','E','R','W','H','E','L','M','I','N','G'};
    char array3[LENGHTARRAY3]={'P','R','E','C','I','S','E','L','Y'};
    char array4[LENGHTARRAY4]={'S','U','B','O','R','D','I','N','A','T','E'};

    printf("\n========== HangMan Game ==========");
    play='x';

    while ((play!='y') && (play!='Y') && (play !='n') && (play!='N'))
    {

        printf("\n\nPlease enter \nY : to start the game \nN : to exit\n");
        scanf("%1s",&play);
        getchar();
        switch(play)
        {
            case 'Y':
            case 'y':
            {
                printf("\nYou just enter in the game\n******** WELCOME ********\n");
                // generate a random number between 0 and 4
                srand(time(NULL));
                r = rand()%5;
                /* after generating the rundom number,
                the program will choose the word that corespond with the random number*/
                switch(r)
                {
                    case 0:
                    {
                        n=LENGHTARRAY0;
                        for(i=0;i<n;i++)
                        {
                            d[i]=array0[i];
                        }
                        break;
                    }
                    case 1:
                    {
                        n=LENGHTARRAY1;

                        for(i=0;i<n;i++)
                        {
                            d[i]=array1[i];
                        }
                        break;
                    }
                    case 2:
                    {
                        n=LENGHTARRAY2;

                        for(i=0;i<n;i++)
                        {
                            d[i]=array2[i];
                        }
                        break;
                    }
                    case 3:
                    {
                        n=LENGHTARRAY3;

                        for(i=0;i<n;i++)
                        {
                            d[i]=array3[i];
                        }
                        break;
                    }
                    case 4:
                    {
                        n=LENGHTARRAY4;

                        for(i=0;i<n;i++)
                        {
                            d[i]=array4[i];
                        }
                        break;
                    }
                }//end inner switch(r)

                /* initialising values that i have to use
                every time when the player want to play again*/

                lenght=n;
                ok=0;
                lenghtletters=-1;
                lives=6;

                printf("your word is:");
                for(i=0;i<lenght;i++)
                {
                    c[i]='_';
                    printf("%c ",c[i]);
                }

                /*enter characters while (ok!=1), that mean the player will be asked to enter
                a character until the word will be guess or until the player run out of lives*/

                while (ok!=1)
                {
                    printf("\n\n\n\n\n\n\n\n\nPlease enter a letter\n");
                    scanf("%1s",&letter);

                    // convert the letter from lowercase to uppercase
                    if (letter>='a' && letter<='z')
                    {
                        letter=letter-32;
                    }

                    // verify if the character that the player entered is a letter or not
                    continu=0;
                    if(letter>='A' && letter<='Z')
                    {
                        continu=1;
                    }

                    /*If the character is a letter, the code check is the letter match or if the
                    letter was entered before, if the character is not a letter thw player will not
                    loose any lives but will be asked to enter another character */

                    switch(continu)
                    {
                        case 1:
                        {
                            must=1;
                            /*here is cheking if the letter was entered before*/
                            for(i=0;i<=lenghtletters;i++)
                            {
                                if(letter==letters[i])
                                {
                                    printf("Sorry,you have already introduced this letter\n");
                                    lives=lives-1;
                                    printf("\nLives= %d",lives);
                                    must=0;

                                    printf("\n\nYour word is: ");
                                    for(i=0;i<lenght;i++)
                                    {
                                        printf("%c ", c[i]);
                                    }
                                }//end if
                            }//end for

                            /* if the letter was entered before, print the letters entered before
                             and the player will be asked to enter another letter*/
                            if(must==0)
                            {
                                printf("\n\nThe letters introduce so far:");
                                for(j=0;j<=lenghtletters;j++)
                                {
                                    printf("%c ",letters[j]);
                                }
                                break;
                            }
                            /*if the letter wasn't entered before, put this letter in the array*/
                            if(must==1)
                            {
                                letters[++lenghtletters]=letter;
                            }
                            //check if the letter match
                            count=0;
                            for(i=0;i<lenght;i++)
                            {
                                if(letter==d[i])
                                {
                                    c[i]=letter;
                                    count=1;
                                }
                            }//end for
                            //if the letter match print some mesages and enter another letter
                            if(count==1)
                            {
                                printf("\nWell done, you guess a letter\n");
                                printf("\n\nYour word is: ");

                                for(j=0;j<lenght;j++)
                                {
                                    printf("%c ", c[j]);
                                }

                                printf("\n\nLives=%d",lives);

                                printf("\n\nThe letters guess so far:");
                                for(j=0;j<=lenghtletters;j++)
                                {
                                    printf("%c ", letters[j]);
                                }
                            }//end if(count==1)
                            /*if the letter don't match,the player lose a live
                            print some mesages and enter another letter if lives not equal with 0*/
                            if(count==0)
                            {
                                lives=lives-1;
                                printf("\n\nSorry, this is not a letter from the word\n");
                                printf("\nYour word is:");

                                for(j=0;j<lenght;j++)
                                {
                                    printf("%c ", c[j]);
                                }

                                printf("\nLives=%d",lives);

                                printf("\nThe letters guess so far:");
                                for(j=0;j<=lenghtletters;j++)
                                {
                                    printf("%c ", letters[j]);
                                }
                            }//end if(count==0)
                            break;
                        }//end case 1

                        /*if the character that the player entered is not a letter
                        the code execute case 0*/
                        case 0:
                        {
                            printf("\nInvalid imput\n");

                            printf("\nLives= %d",lives);

                            printf("\n\nYour word is: ");
                            for(i=0;i<lenght;i++)
                            {
                                printf("%c ", c[i]);
                            }

                            printf("\n\nThe letters guess so far:");
                            for(j=0;j<=lenghtletters;j++)
                            {
                                printf("%c ", letters[j]);
                            }

                            break;
                        }//end case 0

                    }//end inner switch (continu)

                    /*check if the word for guess is finished, if yes the player win and if not the
                    player will be asked to enter another letter if lives not equal with 0*/
                    ok=1;
                    for(i=0;i<lenght;i++)
                    {
                        if(d[i]!=c[i])
                        {
                            ok=0;
                        }
                    }

                    if (ok==1)
                    {
                        printf("\n\n********** WELL DONE, YOU WIN **********\n");
                    }
                    //check if the player has another lives or not
                    if (lives==0)
                    {
                        ok=1;
                        printf("\n\nSorry you run out of lives\n:((:((:((:(( YOU LOST :((:((:((:((");
                        printf("\n\nThe word was: ");
                        for(i=0;i<lenght;i++)
                        {
                            printf("%c",d[i]);
                        }
                    }//end if(lives==0)
                } //end inner while(ok!=1)
                printf("\n\nDo you want to play again?(Y/N)");

                getchar();
                break;
            }//end case y - outer switch
            /* after the player is asked if he want to play again
            if he enter N the game will be over and if he enter Y he will play again*/

            case 'N':
            case 'n':
            {
                system("exit");
                break;
            }
            /*when the player is asked to play again, he enter another character instead of Y or N,
            he will see that he enter an invalid imput and will be asked to press enter and after,
            to take a correct decision and enter Y or N if he want to play again or no*/
            default:
            {
                printf("\nInvalid imput, press enter");

                getchar();
                break;
            }
        }//end outer switch(play)
    }//end outer while
}//end main ()
