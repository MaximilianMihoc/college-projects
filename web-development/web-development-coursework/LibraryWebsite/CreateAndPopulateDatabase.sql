
--Create table Users
create table Users(
	Username Varchar(20),
	Password Varchar(20),
	FirstName Varchar(20),
	Surname Varchar(20),
	AddressLine1 Varchar(30),
	AddressLine2 Varchar(20),
	City Varchar(20),
	Telephone Numeric(7),
	Mobile Numeric(9),
	Primary Key (Username)
	);

--Create table Categories
Create Table Categories(
	CategoryID Varchar(6),
	CategoryDescription Varchar(20),
	Primary Key (CategoryID)
	);

	
-- Create table Books
Create table Books(
	ISBN Varchar(20),
	BookTitle Varchar(30),
	Author Varchar(30),
	Edition Numeric(4),
	BookYear Numeric(4),
	CategoryID Varchar(6),
	Reserved Char ,
	Primary Key (ISBN),
	Foreign Key (CategoryID) References Categories(CategoryID)
	);
	
--Create table Reservations	
Create table Reservations(
	ReservationID MEDIUMINT NOT NULL AUTO_INCREMENT,
	ISBN Varchar(20),
	Username Varchar(20),
	ReservedDate Date,
	Primary Key (ReservationID),
	Foreign Key (ISBN) References Books(ISBN),
	Foreign Key (Username) References Users(Username)
	);
	
Insert into Users Values ('alanjmckenna', 't1234s', 'Alan', 'McKenna', '38 Cranley Road', 'Fairview', 'Dublin', 9998377, 856625567);
Insert into Users Values ('joecrotty', 'kj7899', 'Joseph', 'Crotty', 'Apt 5 Clyde Road', 'Donnybrook', 'Dublin', 8887889, 876654456);
Insert into Users Values ('tommy100', '123456', 'tom', 'behan', '14 hyde road', 'Dalkey', 'Dublin', 9983747, 876738782);
	
Insert into Categories Values('001', 'Health');
Insert into Categories Values('002', 'Business');
Insert into Categories Values('003', 'Biography');
Insert into Categories Values('004', 'Technology');
Insert into Categories Values('005', 'Travel');
Insert into Categories Values('006', 'Self-Help');
Insert into Categories Values('007', 'Cookery');
Insert into Categories Values('008', 'Fiction');

Insert into Books Values('093-403992', 'Computers in Business', 'Alicia Oneill', 3, 1997, '003', 'N');
Insert into Books Values('23472-8729', 'Exploring Peru', 'Stephanie Birchie', 4, 2005, '005', 'N');
Insert into Books Values('237-34823', 'Business Strategy', 'Joe Peppard', 2, 2002, '002', 'N');
Insert into Books Values('23u8-923849', 'A guide to nutrition', 'John Thorpe', 2, 1997, '001', 'N');
Insert into Books Values('2983-3494', 'Cooking for children', 'Anabelle Sharpe', 1, 2003, '007', 'N');
Insert into Books Values('82n8-308', 'Computers for idiots', 'Susan O''Neill', 5, 1998, '004', 'N');
Insert into Books Values('9823-23984', 'My life in picture', 'Kevin Graham', 8, 2004, '001', 'N');
Insert into Books Values('9823-2403-0', 'DaVinci Code', 'Dan Brown', 1, 2003, '008', 'N');
Insert into Books Values('98234-029384', 'My ranch in Texas', 'George Bush', 1, 2005, '001', 'Y');
Insert into Books Values('9823-98345', 'How to cook Italian food', 'Jamie Oliver', 7, 2005, '007', 'Y');
Insert into Books Values('9823-98487', 'Optimising your business', 'Cleo Blair', 1, 2001, '002', 'N');
Insert into Books Values('988745-234', 'Tara Road', 'Maeve Binchy', 4, 2002, '008', 'N');
Insert into Books Values('993-004-00', 'My life in bits', 'John Smith', 1, 2001, '001', 'N');
Insert into Books Values('9987-0039882', 'Shooting History', 'Jon Snow', 1, 2003, '001', 'N');

Insert into Reservations (ISBN, Username, ReservedDate) 
	Values('98234-029384', 'joecrotty', '2008-10-11');
Insert into Reservations (ISBN, Username, ReservedDate) 
	Values('9823-98345', 'tommy100', '2008-10-11');
	

/*
Insert into Books Values('98234-9384', 'In Defense of Food', ' Michael Pollan', 1, 2008, '001', 'N');
Insert into Books Values('19834-9384', 'The Omnivores Dilemma', ' Michael Pollan', 10, 2006, '001', 'N');
Insert into Books Values('12834-9384', 'The Dark Side Meal', ' Eric Schlosser', 3, 2001, '001', 'N');
Insert into Books Values('12938-9334', 'Food Rules: An Eaters Manual', ' Michael Pollan', 1, 2009, '001', 'N');
Insert into Books Values('14237-343', 'The One Thing You Need to Know', 'Marcus Buckingham', 2, 2003, '002', 'N');
Insert into Books Values('12237-34309', 'Winning', 'Jack Welch', 4, 2007, '002', 'N');
Insert into Books Values('13237-34309', 'Rich Dad, Poor Dad', 'Robert T. Kiyosaki', 4, 2004, '002', 'N');
Insert into Books Values('14237-309', 'Who', 'Geoff Smart', 8, 2001, '002', 'N');
Insert into Books Values('15237-3091', 'Powerful Leadership Proverbs', 'Bill Hybels', 9, 2012, '002', 'N');
Insert into Books Values('1093-4032', 'Steve Jobs', 'Walter Isaacson', 2, 2011, '003', 'N');
Insert into Books Values('1293-4132', 'Einstein', 'Walter Isaacson', 1, 1990, '003', 'N');
Insert into Books Values('1393-4232', 'Into the Wild', 'Jon Krakauer', 3, 2000, '003', 'N');
Insert into Books Values('1493-433', 'John Adams', 'David McCullough', 5, 2001, '003', 'N');
Insert into Books Values('1593-4432', 'Truman', 'David McCullough', 9, 2012, '003', 'N');
Insert into Books Values('1001-001', 'The Innovators Dilemma', 'Clayton Christensen', 2, 1997, '004', 'N');
Insert into Books Values('1001-002', 'The Soul of a New Machine', 'Tracy Kidder', 1, 1981, '004', 'N');
Insert into Books Values('1001-003', 'Andy Grove', 'Richard S. Tedlow', 1, 2006, '004', 'N');
Insert into Books Values('1001-004', 'The New New Thing', 'Michael Lewis', 1, 2001, '004', 'N');
Insert into Books Values('1001-005', 'The World is Flat', 'Thomas Friedman', 1, 2005, '004', 'N');
Insert into Books Values('1001-006', ' The Chip', 'T.R. Reid', 1, 1985, '004', 'N');
Insert into Books Values('1232-8729', 'On the Road', 'Jack Kerouac', 1, 2002, '005', 'N');
Insert into Books Values('12347-8728', 'Exploring Europae', 'Stephanie', 3, 2005, '005', 'N');
Insert into Books Values('82635-1001', 'The Da Vinci Code', 'Dan Brown', 1, 2003, '008', 'N');
Insert into Books Values('82635-1002', 'The Great Gatsby', 'F. Scott Fitzgerald', 1, 1925, '008', 'N');
Insert into Books Values('82635-1003', 'The Hunger Games', ' Suzanne Collins', 1, 2008, '008', 'N');
Insert into Books Values('82635-1004', 'The Catcher in the Rye', 'J.D. Salinger', 1, 1951, '008', 'N');
Insert into Books Values('82635-1005', 'Life of Pi', 'Yann Martel', 1, 2001, '008', 'N');*/

	
	