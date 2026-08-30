/*
    This is an employee database
*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
//functions prototypes
void AddEmployee (void);
void ListEmployee(void);
void DeleteEmployee(void);
void AddHeader(void);
void CountRecords(void);
int CheckNumber(char []);
void Compact(void);
//define the header structure
struct header
{
    int total_records;
    int number_of_deleted_records;
    char filler[16];
};
//define the employee srtucture
struct employee
{
    char number[6];
    char last_name[16];
    char first_name[16];
    char address[26];
    char department_code[10];
    char duration[2];
};

void main()
{
    char choice = 'n';
    int wish;
    char create = 'n';

    printf("\t====================HELLO====================");

    FILE *file;
    file = fopen("employee.dat","rb"); //open file just for reading

    if(file == NULL) //check if the file exists, if not, create the file
    {
        printf("ERROR: File doesn't exist. Do you want me to create id?(Y/N)");
        scanf("%s",&create);
        getchar();
        if(create == 'y' || create == 'Y')
        {
            AddHeader();  // Call function AddHeader to create the Employee file with header in it
        }
    }
    else
    {
        fclose(file);
    }

    while (choice == 'n' || choice == 'N')
    {
        printf("\n\n\n\t\tMENU");
        printf("\n\t\t1: Add Employee");
        printf("\n\t\t2: Delete Employee");
        printf("\n\t\t3: List Employees");
        printf("\n\t\t4: Compact");
        printf("\n\t\t5: Exit\n\n");

        printf("\nEnter a number (1-5): ");
        scanf("%d", &wish);
        getchar();

        switch(wish)
        {
            case 1:
            {
                AddEmployee();
                break;
            }
            case 2:
            {
                DeleteEmployee();
                break;
            }
            case 3:
            {
                ListEmployee();
                break;
            }
            case 4:
            {
                printf("\tThe Employee file was succsesfuly compacted");
                Compact();
                break;
            }
            case 5:
            {
                system("exit");
                break;
            }
            default:
            {
                printf("\nInvalid imput");
                break;
            }

        }

        printf("\n\t\t\tDo you want to exit?(Y/N)");
        scanf("%s",&choice);
        getchar();
    }

}

void AddHeader()   // This function is creating the employee data file with header in it
{
    struct header head;

    FILE *file;
    file = fopen("employee.dat", "wb"); // open file for writing

    head.total_records = 0;
    head.number_of_deleted_records = 0;

    fwrite(&head,sizeof(head),1,file); //write the header in file with 0 records

    fclose(file);
}

void AddEmployee ()           //fuction to add an employee in database
{
    struct employee details;
    struct header head;

    FILE *file;
    file = fopen("employee.dat", "r+b");  //open file for reading and writing
    char choose='y';

    if(file == NULL)            //check if the file exists
    {
        printf("ERROR: Failed to open file!");
    }
    else
    {
        while(choose == 'y' || choose == 'Y')
        {
            fseek(file,sizeof(head),SEEK_CUR);  // sets the file-position indicator value after the header in the employee database file

            while(fread(&details,sizeof(details),1,file) != 0)
            {
                if(details.number[0] == '*')
                {
                    /*if the record is marked with an asterix in first byte, set the pointer before
                     *this record and another record can be added instead of the deleted one
                     */
                    fseek(file,-sizeof(details),SEEK_CUR);
                    break;     //this will stop the while loop
                }
            }
            //In the following lines, another record will be entered

            do
            {
                printf("\n Enter employee number: ");
                gets(details.number);
                /*after entering the employee number, check in the function CheckNumber(), if the number exist or not.
                 * If the number exist already, a message will be printed and the user will be ascked to add another employee number
                 */
                if(CheckNumber(details.number) == 0)
                {
                    printf("\nSorry, this employee number already exists\n");
                }
            }while(CheckNumber(details.number) == 0);

            printf("\n Enter employee last name: ");
            gets(details.last_name);

            printf("\n Enter employee first name: ");
            gets(details.first_name);

            printf("\n Enter employee address: ");
            gets(details.address);

            printf("\n Enter employee department code: ");
            gets(details.department_code);

            printf("\n Enter employee duration: ");
            gets(details.duration);

            fwrite(&details, sizeof(details),1,file); //copy all details that the user entered, in employee database

            printf("\n\t\t\t Add another record?(Y/N): ");
            scanf("%s", &choose);
            getchar();

            fseek(file,0,SEEK_SET);
        }
    }
    fclose(file);
}
void ListEmployee()
{
    struct employee details;
    struct header head;

    CountRecords(); //this function count the records from employee file and change it in header

    FILE *file;

    file=fopen("employee.dat","rb");        //open file for read only

    if(file == NULL)
    {
        printf("ERROR: Failed to open file!");
    }
    else
    {

        fread(&head,sizeof(head),1,file);    //read the header from the file and display it in the next two lines

        printf("\nThe number of  total  records is: %d",head.total_records);
        printf("\nThe number of deleted records is: %d\n\n",head.number_of_deleted_records);

        // Display all records from the file, without deleted records (those marcked with stars)
        while(fread(&details,sizeof(details),1,file) != 0)
        {
            if(details.number[0] != '*')
            {
                printf("\nEmployee   number: %s",details.number);
                printf("\nEmployee las_name: %s",details.last_name);
                printf("\nEmployee fir_name: %s",details.first_name);
                printf("\nEmployee  address: %s",details.address);
                printf("\nEmployee dep_code: %s",details.department_code);
                printf("\nEmployee duration: %s\n\n",details.duration);
            }

        }
    }
    fclose(file);
}

void DeleteEmployee()
{
    struct employee details;
    struct header head;

    char delnumber[6];
    char asterisk = '*';
    char delnumber_matched = 'n';

    FILE *file;
    file = fopen("employee.dat","r+b"); //open file for reading and writhing

    if(file == NULL)
    {
        printf("ERROR: Failed to open file!");
    }
    else
    {
        printf("\nType in the number of employee you want to delete: ");
        gets(delnumber);  // enter the number of employee that you want to delete

        fseek(file,0,SEEK_SET);
        fseek(file,sizeof(head),SEEK_CUR);   // sets the file-position indicator after the header in the file

        while(fread(&details,sizeof(details),1,file) != 0)
        {
            //search in the file the employee number which match with the number that we want to delete
            if(strcmp(delnumber,details.number) == 0)
            {
                //if the record was found, ptu a star in first byte
                fseek(file,-sizeof(details),SEEK_CUR);  //sets the file-position indicator right before the first byte of that record
                fwrite(&asterisk, 1, 1, file);          // put the asteriks in the first byte
                fseek(file, 0, SEEK_END);               // sets the file-position indicator at the end of file
                printf("\n Record was successfully deleted! \n");
                delnumber_matched = 'y';
            }
        }

        if(delnumber_matched == 'n')
        {
            printf("\n Record was not found!");
        }
    }
    fclose(file);
}

void CountRecords()
{
    struct employee details;
    struct header head;

    int total=0,deleted=0;

    FILE *file;
    file = fopen("employee.dat","r+b"); //open the employee file for reading and writing

    fread(&head,sizeof(head),1,file); // read the header from the file

    while(fread(&details,sizeof(details),1,file) != 0)
    {
        //count the records in the file, if the record has a star in first byte increment both variabes with one
        if(details.number[0] == '*')
        {
            total++;
            deleted++;
        }
        else // if the record don't has an asteriks in first byte increment the number of total records
        {
            total++;
        }
    }
    //assign the values
    head.total_records = total;
    head.number_of_deleted_records = deleted;

    fseek(file,0,SEEK_SET);             //sets the file-position indicator value at the beginning of file
    fwrite(&head,sizeof(head),1,file);  //wrire the correct header in the employee database

    fclose(file);
}

int CheckNumber(char num[])         // function to check if the employee number was entered before and return 0 if the number was entered before or 1 in the other case
{
    struct employee details;
    struct header head;

    FILE *file;
    file = fopen("employee.dat","rb");      //open file for reading

    if(file == NULL)
    {
        printf("ERROR: Failed to open file!");
    }
    else
    {
        fseek(file,sizeof(head),SEEK_CUR);     //sets the file-position indicator value after the header
        int ok=1;

        while(fread(&details,sizeof(details),1,file) != 0)          //read all records from file and check if num exists in the file
        {
            if(strcmp(num,details.number) == 0)
            {
                ok=0;
            }
        }

        if(ok == 1)
        {
            return 1; // the employee number is good
        }
        else
        {
            return 0; // the employee number already exists
        }
    }
}
void Compact()
{
    struct employee details;
    struct header head;

    FILE *file, *temp;

    file = fopen("employee.dat","rb");      //open employee file for reading
    temp = fopen("temp.dat","wb");          // create and onep a temporary file to store the header and all records from employee file, without the deleted records

    fread(&head,sizeof(head),1,file);       //read the header from employee
    fwrite(&head,sizeof(head),1,temp);      //write the header in the temporary file

    fseek(file,0,SEEK_SET);
    fseek(file,sizeof(head),SEEK_CUR);      //sets the file-position indicator value after the header in the employee file

    while(fread(&details,sizeof(details),1,file) != 0)
    {
        if(details.number[0] != '*') //if the record is not marcked with astericks in first byte, copy record in the temporary file
        {
            fwrite(&details,sizeof(details),1,temp);
        }
        else
        {   //if the records are marcked with astericks in the first byte, do not copy them in the temporary file, go to the next record
            fseek(file,-sizeof(details),SEEK_CUR);
            fseek(file,sizeof(details),SEEK_CUR);
        }
    }
    fclose(file);
    fclose(temp);

    file = fopen("employee.dat","wb");      // open again employee file for writing, dte data will be overwrite
    temp = fopen("temp.dat","rb");          //open temporary file for reading

    fread(&head,sizeof(head),1,temp);       //read head from temp file
    fwrite(&head,sizeof(head),1,file);      // write the head in employee file again

    fseek(file,0,SEEK_SET);
    fseek(file,sizeof(head),SEEK_CUR);

    // copy all records from temp file into employee file
    while(fread(&details,sizeof(details),1,temp) != 0)
    {
        fwrite(&details,sizeof(details),1,file);
    }
    fclose(file);
    fclose(temp);
}
