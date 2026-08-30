--Study Case: Peter Pets             
--
-- Create and Populate tables.

 
-- Drop all tables to make sure they do not exist in the Database already
DROP TABLE  TREATMENT CASCADE CONSTRAINTS PURGE;
DROP TABLE  HOUSING CASCADE CONSTRAINTS PURGE;
DROP TABLE  DailyCheck CASCADE CONSTRAINTS PURGE;
DROP TABLE  SOrder CASCADE CONSTRAINTS PURGE; 
DROP TABLE  SpecialOrder CASCADE CONSTRAINTS PURGE; 
DROP TABLE  Instruction CASCADE CONSTRAINTS PURGE;
DROP TABLE  SPECIES CASCADE CONSTRAINTS PURGE;
DROP TABLE  STOCK CASCADE CONSTRAINTS PURGE; 
DROP TABLE  SUPPLIER CASCADE CONSTRAINTS PURGE; 
DROP TABLE  CustomerOrder CASCADE CONSTRAINTS PURGE; 
DROP TABLE  CUSTOMER CASCADE CONSTRAINTS PURGE; 
DROP TABLE  STAFF CASCADE CONSTRAINTS PURGE; 
 
 /*                 Create Tables                            */
 
-- create table Staff with employee_id as a primary key that has to de unique
CREATE TABLE  STAFF 
( 
	--creating primary key attribute, type number with maximum 6 digits
	 employee_id          NUMBER(6)  PRIMARY KEY , 
	 employee_name       VARCHAR2(20) ,  -- create attribute employee_name as a varchar2 (string with maximum 20 characters)
	 employee_phone_number   NUMBER(9) , -- create phone number attribute as a number with 9 digits 
	 employee_address    VARCHAR2(30)   , -- address attribute should be a string as well
	 employee_email      VARCHAR2(25)  UNIQUE, -- email attribute should be string and unique, there can't be more people with same email address
	 hire_date           DATE , 
	 employee_salary      NUMBER(5,2) , -- the salary attribute I created to be with 5 digits in total and 2 decimal places. The biggest salary can be 999.99
	 --Constraint that check if the prone number has 9 digits. A number should have 10 digits
	 --but the first digit is always 0 and we only have to worry about the other 9 digits
	 CHECK (employee_phone_number > 99999999 And employee_phone_number < 1000000000 ),
	 --Check if the hire date is in the past or in the present. The hire date can not be in future
	 --CHECK(hire_date <= sysdate),
	 CHECK (employee_salary > 0) -- check if the salary is grather than 0 because the salary can not be less than or equal to 0
);
 
-- Create table Customer with customer_id as a primary key and employee_id as foreign key
CREATE TABLE  CUSTOMER 
( 
	 customer_id          NUMBER(6)  PRIMARY KEY , -- create primary key a number with maximum 6 digits
	 employee_id          NUMBER(6)  REFERENCES  STAFF , -- Employee_id is a foreign key in this table with a reference to Staff table
	 customer_name       VARCHAR2(25) , -- name attribute has 25 characters long and it is type varchar2
	 customer_address    VARCHAR2(30) , -- address is type varchar2 with 30 characters
	 customer_phone_number   NUMBER(10) , 
	 customer_email      VARCHAR2(25) UNIQUE,
	 --Constraint that check if the prone number has 9 digits. A number should have 10 digits
	 --but the first digit is always 0 and we only have to worry about the other 9 digits. I am using Between this time.
	CHECK (customer_phone_number BETWEEN 99999999 And 1000000000 )
);
 
select * from customer; 

update customer
set customer_address = 'Kevin street'
where customer_name = 'Marcu';

alter table customer
modify customer_address varchar(200);




-- create table CustomerOrder with COrderID as primary key
CREATE TABLE  CustomerOrder 
( 
	 COrderID             NUMBER(6)  PRIMARY KEY , -- create primary key 
	 customer_id          NUMBER(6)  REFERENCES  CUSTOMER , -- create foreign key with reference to Customer table
	 employee_id          NUMBER(6)  REFERENCES  STAFF , -- create foreign key with reference to Staff table
	 Order_date          DATE , -- create date attribute, type date. This time the order date can be in past, present or future so there is no need to check it
	 Price                NUMBER(10,2) , -- price of a order can have 10 digits with 2 decimal places
	 OrderAmount          NUMBER(5) , 
	 OrderDetail         VARCHAR2(20),
	 CHECK (Price > 0) -- check if the price is grather than 0 because the price can not be less than or equal to 0
);
 
-- create table Supplier with Supplier_id as primary Key
CREATE TABLE  SUPPLIER 
( 
	 supplier_id          NUMBER(6)  PRIMARY KEY , -- create primary Key
	 supplier_name       VARCHAR2(20) , -- create attribute for supplier name with 20 characters
	 supplier_address    VARCHAR2(30) , -- create attribute for supplier address with 30 characters
	 supplier_email      VARCHAR2(30) UNIQUE -- Creating supplier email that should be unique
	 
);
 
--create table Stock with stock_id primary key and supplier_id as foreign key reference to Supplier table
CREATE TABLE  STOCK 
( 
	 stock_id             NUMBER(6)  PRIMARY KEY , -- create primary key
	 supplier_id          NUMBER(6)  REFERENCES  SUPPLIER , -- create foreign key with reference to Supplier table
	 Sname                VARCHAR2(20) , -- create an attribute that stores the name of item in stock. 20 characters long
	 no_in_stock          NUMBER(4) ,
	 price                NUMBER(6,2) ,
	 item_description    VARCHAR2(100) ,
	 CHECK (price > 0) -- check if the price is greater than 0 because the price can not be less than or equal to 0
);
 
-- create table Species with Species_id as primary key
CREATE TABLE  SPECIES 
( 
	 species_id           NUMBER(6)  PRIMARY KEY , -- create primary key
	 species_name        VARCHAR2(40),
	 species_price        NUMBER(5,2),
	 number_in_stock      NUMBER(3),
	 Instructions_id      NUMBER(6),
	 stock_id             NUMBER(6)  REFERENCES  STOCK , -- create foreign key with reference to Stock table
	 CHECK (species_price > 0) -- check if the species_price is grater than 0 because the species_price can not be less than or equal to 0
);
 
-- create table Instruction with Instruction_id as primary key
CREATE TABLE  Instruction 
( 
	 instruction_id       NUMBER(6)  PRIMARY KEY , -- create primary key
	 species_id           NUMBER(6)  REFERENCES  SPECIES , -- create foreign key with reference to Species table
	 housing_needed      VARCHAR2(10), -- create attribute to specify what kind of house the specific species needs
	 food                VARCHAR2(300),
	 health_care         VARCHAR2(300),
	 cleaning_requirements  VARCHAR2(300)
);
 
-- create table SpecialOrder with OrderId as primary key
-- This table is used If a special order was made and the supplier has to deliver the order to the customer
CREATE TABLE  SpecialOrder 
( 
	 OrderID              NUMBER(6)  PRIMARY KEY , -- create primary key
	 customer_id          NUMBER(6)  REFERENCES  CUSTOMER , -- create foreign key with reference to Customer table
	 supplier_id          NUMBER(6)  REFERENCES  SUPPLIER , -- create foreign key with reference to Supplier table
	 OrderDate           DATE,
	 Price                NUMBER(8,2) ,
	 OrderAmount          NUMBER(5),
	 OrderDetail         VARCHAR2(20),
	 CHECK (Price > 0) -- check if the Price is grater than 0 because the Price can not be less than or equal to 0

);
 
-- create table Sorder with order_is primary key
CREATE TABLE  SOrder 
( 
	 order_id             NUMBER(6)  PRIMARY KEY , -- create primary key
	 stock_id             NUMBER(6)  REFERENCES  STOCK , -- create foreign key with reference to Stock table
	 employee_id          NUMBER(6)  REFERENCES  STAFF , -- create foreign key with reference to Staff table
	 SOname                VARCHAR2(20),
	 quantity             NUMBER(10,2),
	 order_date          DATE,
	 order_description   VARCHAR2(20),
	 order_price         VARCHAR2(9),
     CHECK (order_price > 0) -- check if the order_price is grater than 0 because the order_price can not be less than or equal to 0
);
 
-- create dailyCheck table with check_id as primary key 
CREATE TABLE  DailyCheck 
( 
	 check_id             NUMBER(6)  PRIMARY KEY , -- create primary key
	 employee_id          NUMBER(6)  REFERENCES  STAFF , -- create foreign key with reference to STAFF table
	 species_id           NUMBER(6)  REFERENCES  SPECIES , -- create foreign key with reference to SPECIES table
	 check_date          DATE, 
	 disease_present     CHAR Default 'N', -- create disease present attribute to see if the disease is present or not. This is by default N (NO). 
	 fed                 CHAR Default 'N',  -- create fed attribute to see if the disease is present or not. This is by default N (NO).
	 cleaned             CHAR Default 'N',  -- create cleaned attribute to see if the disease is present or not. This is by default N (NO).
	 exercised           CHAR Default 'N',  -- create exercised attribute to see if the disease is present or not. This is by default N (NO).
	Check (disease_present = 'N' or disease_present = 'Y'), -- this constraint check if the disease_present value is N or Y as these are the only 2 values allowed
	Check (fed = 'N' or fed = 'Y'), -- this constraint check if the fed value is N or Y as these are the only 2 values allowed
	Check (cleaned = 'N' or cleaned = 'Y'), -- this constraint check if the cleaned value is N or Y as these are the only 2 values allowed
	Check (exercised = 'N' or exercised = 'Y') -- this constraint check if the exercised value is N or Y as these are the only 2 values allowed
);
 
-- create table Housing with housing_id as a primary key
CREATE TABLE  HOUSING 
( 
	 housing_id           NUMBER(6)  PRIMARY KEY , -- create primary key
	 species_id           NUMBER(6)  REFERENCES  SPECIES ,-- create foreign key with reference to Customer table
	 house_type                VARCHAR2(10),
	 contamined          CHAR Default 'N',  -- create contamined attribute to see if the disease is present or not. This is by default N (NO).
	 capacity             NUMBER(6,2),
	 Check (contamined = 'N' or contamined = 'Y') -- this constraint check if the contamined value is N or Y as these are the only 2 values allowed

);
 
-- create treatment attribute with treatment_id as a primary key
CREATE TABLE  TREATMENT 
( 
	 treatment_id         NUMBER(6)  PRIMARY KEY , -- create primary key
	 species_id           NUMBER(6)  REFERENCES  SPECIES ,  -- create foreign key with reference to Customer table
	 description         VARCHAR2(20) ,
	 date_begun          DATE, 
	 date_complete       DATE 
	 -- date begun and date complete can be in present future or past, we don't need a check constraint here
);
 

 
 /*                  Populate Tables                        */
 
--populate Staff table, this table can be populated first because it doesn't have any references

Insert Into Staff (employee_id, employee_name, employee_phone_number, employee_address, employee_email, hire_date, employee_salary)
  Values(10, 'Peter', 0871238473, 'Clondalkin Dublin 22', 'Peter@yahoo.com', '04-JUN-03', 987.98);
Insert Into Staff (employee_id, employee_name, employee_phone_number, employee_address, employee_email, hire_date, employee_salary)
  Values(11, 'Marius', 0873627181, 'Marino Dublin 3', 'Marius@gmail.com', '01-JUL-03', 700);
Insert Into Staff (employee_id, employee_name, employee_phone_number, employee_address, employee_email, hire_date, employee_salary)
  Values(12, 'Richard', 0898760291, 'City Center Dublin', 'Rich@gmail.com', '13-JUN-04', 650);
  
--Populate Supplier table, this table has no reference so it can be populated
Insert into Supplier (supplier_id, supplier_name, supplier_address, supplier_email)
  Values(101, 'Cosmin', 'Ferview Dublin 3', 'Cos@yahoo.com');
Insert into Supplier (supplier_id, supplier_name, supplier_address, supplier_email)
  Values(102, 'Sergiu', 'Howth Road', 'Sergiu@yahoo.com');
Insert into Supplier (supplier_id, supplier_name, supplier_address, supplier_email)
  Values(103, 'John', 'Ferview Dublin 3', 'John@gmail.com');
  
--Populate Stock table, this table can be populated just if the supplier table is populated because it has a reference to that table
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (1, 'Cat', 30, 25.3, 'Domestic', 102);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (2, 'Dog', 20, 35.3, 'Domestic', 103);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (3, 'Fish', 100, 4.99, 'Tropical', 101);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (4, 'Birds', 44, 20, 'Flying', 102);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (5, 'Reptile', 35, 23.3, 'Vertebrates', 103);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (6, 'Cage', 10, 55, 'For cats and dogs', 102);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (7, 'Tank', 10, 45.50, 'For fish', 101);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (8, 'Cat food', 60, 20, 'Dry and Wet food for cats', 102);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (9, 'Dog food', 60, 20, 'Food for dogs', 103);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (10, 'Birds food', 60, 20, 'Food for birds', 102);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (11, 'Reptile food', 60, 20, 'Food for reptiles', 103);
Insert into stock (stock_id, sname, no_in_stock, Price, item_description, supplier_id)
  values (12, 'Fish food', 60, 20, 'Food for fish', 101);

--populate Spesies table, can be populated if stock table was populated because we need to know what stock id it will have
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(100, 'Norwegian Forest', 65, 10, 10, 1);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(101, 'Persian', 25.3, 5, 11, 1);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(102, 'Siamese', 155, 15, 12, 1);
  
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(103, 'Pit Bull', 100, 5, 13, 2);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(104, 'Beagle', 45, 10, 14, 2);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(105, 'Boxer', 5.50, 5, 15, 2);
  
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(106, 'Angelfish', 4.99, 30, 16, 3); 
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(107, 'Banded archerfish', 10.99, 30, 17, 3);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(108, 'Neon Tetra', 15.99, 40, 18, 3);
  
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(109, 'Abyssinian Lovebird', 20, 14, 19, 4);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(110, 'African Grey Species', 15.99, 10, 20, 4);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(111, 'Alexandrine Parakeet', 19.99, 20, 21, 4);
  

Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(112, 'BEARDED DRAGON', 23.3, 5, 22, 5);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(113, 'BOX TURTLE', 20, 10, 23, 5);
Insert into Species(species_id, species_name, species_price, number_in_stock, instructions_id, stock_id)
  Values(114, 'CORN SNAKE', 19.99, 15, 24, 5);
    
--Populate Housing table, can be populated if Species table was populated because it has a reference to that table
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(1, 100, 'cage', 'N', 50);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(2, 101, 'cage', 'N', 50);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(3, 102, 'cage', 'N', 50);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(4, 103, 'cage', 'N', 100);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(5, 104, 'cage', 'N', 100);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(6, 105, 'cage', 'N', 100);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(7, 106, 'tank', 'N', 150);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(8, 107, 'tank', 'Y', 150);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(9, 108, 'tank', 'Y', 150);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(10, 109, 'cage', 'N', 50);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(11, 110, 'cage', 'Y', 50);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(12, 111, 'cage', 'N', 50);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(13, 112, 'tank', 'N', 70);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(14, 113, 'tank', 'Y', 70);
Insert into Housing (housing_id, species_id, house_type, contamined, capacity)
  Values(15, 114, 'tank', 'N', 70);
  
--Populate DailyCheck table, can be populated if both, Staff and Species tables were populated
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(1, 10, 100, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(2, 10, 101, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(3, 10, 102, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(4, 11, 103, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(5, 11, 104, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(6, 11, 105, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(7, 11, 106, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(8, 12, 107, '16-NOV-13', 'Y', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(9, 12, 108, '16-NOV-13', 'Y', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(10, 12, 109, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(11, 10, 110, '16-NOV-13', 'Y', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(12, 10, 111, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(13, 10, 112, '16-NOV-13', 'Y', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(14, 11, 113, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
Insert into DailyCheck (check_id, employee_id, species_id, check_date, disease_present, fed, cleaned, exercised)
  Values(15, 11, 114, '16-NOV-13', 'N', 'Y', 'Y', 'Y');
  
--populate Treatment table, can be populated id Species table was populated
Insert into Treatment (treatment_id, species_id, description, date_begun)
  Values(10, 107, 'currative', '16-NOV-13');
Insert into Treatment (treatment_id, species_id, description, date_begun)
  Values(11, 108, 'currative', '16-NOV-13');
Insert into Treatment (treatment_id, species_id, description, date_begun)
  Values(12, 110, 'preventive', '16-NOV-13');
Insert into Treatment (treatment_id, species_id, description, date_begun)
  Values(13, 113, 'preventive', '16-NOV-13');
  
--Populate table Instruction, can be populated id Species table was populated
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(10, 100, 'cage', 'Wellness', 'Fresh food and water daily', 'Get the right cat shampoo.');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(11, 101, 'cage', 'EVO', 'Fresh food and water daily', 'Make your cat want to bathe');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(12, 102, 'cage', 'Purina', 'Fresh food and water daily', 'Bathe your small kitty in a sink or small tub');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(13, 103, 'cage', 'Natural Balance', 'Fresh food and water daily', 'Wash your dog at least one a week');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(14, 104, 'cage', 'Merrik', 'Fresh food and water daily', 'Wash your dog at least one a week');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(15, 105, 'cage', 'PetGuard', 'Fresh food and water daily', 'Wash your dog at least one a week');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(16, 106, 'tank', 'Marina', 'Keep Tank water warm, approx 16 degrees Celsius', 'Tank water every week with warm water');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(17, 107, 'tank', 'Fluval', 'Keep Tank water warm, approx 16 degrees Celsius', 'Tank water every week with warm water');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(18, 108, 'tank', 'Aqualear', 'Keep Tank water warm, approx 16 degrees Celsius', 'Tank water every week with warm water');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(19, 109, 'cage', 'Prevue', 'Birds are delicate and complex creatures that need lots of loving care and attention to be happy and healthy', 'Make sure the cage is always clean');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(20, 110, 'cage', 'Pretty bird', 'Birds are delicate and complex creatures that need lots of loving care and attention to be happy and healthy', 'Make sure the cage is always clean');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(21, 111, 'cage', 'Carefresh', 'Birds are delicate and complex creatures that need lots of loving care and attention to be happy and healthy', 'Make sure the cage is always clean');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(22, 112, 'tank', 'Exo Terra', 'Requires something to constantly chew on for dental health', 'Change litter daily, new bowl of water and food daily');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(23, 113, 'tank', 'Zilla Rules', 'Keep Tank water warm, approx 16 degrees Celsius', 'Change litter daily, new bowl of water and food daily');
Insert into Instruction (instruction_id, species_id, housing_needed, food, health_care, cleaning_requirements)
  Values(24, 114, 'tank', 'Carefresh', 'Tank water every week with warm water', 'Change litter daily, new bowl of water and food daily');

--Populate Customer table, can be populated if Customer and Staff tables were populated
Insert into Customer(customer_id, employee_id, customer_name, customer_address, customer_phone_number, customer_email)
  Values(20001, 10, 'Marcu', 'address', 0896547512, 'Marc@yahoo.com');
Insert into Customer(customer_id, employee_id, customer_name, customer_address, customer_phone_number, customer_email)
  Values(20002, 10, 'Florin', 'address', 0896452112, 'Florinc@yahoo.com');
Insert into Customer(customer_id, employee_id, customer_name, customer_address, customer_phone_number, customer_email)
  Values(20003, 11, 'Edward', 'address', 0896547578, 'ED@yahoo.com');
Insert into Customer(customer_id, employee_id, customer_name, customer_address, customer_phone_number, customer_email)
  Values(20004, 12, 'KArina', 'address', 0896542139, 'Karina@yahoo.com');

-- Populate SOrder table, can be populated if Stock and Staff tables were populated
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(1, 1, 10, 'order1', 30, '07-MAY-2012', 'stock order', 759);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(2, 2, 10, 'order2', 20, '13-MAY-2012', 'stock order', 706);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(3, 3, 10, 'order3', 100, '07-MAY-2012', 'stock order', 499);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(4, 4, 11, 'order4', 44, '07-JUL-2013', 'stock order', 880);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(5, 5, 11, 'order5', 35, '07-JUL-2013', 'stock order', 815.5);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(6, 6, 12, 'order6', 10, '14-AUG-2013', 'stock order', 550);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(7, 7, 12, 'order7', 10, '14-AUG-2013', 'stock order', 455);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(8, 8, 10, 'order8', 60, '01-NOV-2013', 'stock order', 1200);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(9, 9, 10, 'order9', 60, '01-NOV-2013', 'stock order', 1200);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(10, 10, 10, 'order10', 60, '01-NOV-2013', 'stock order', 1200);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(11, 11, 10, 'order11', 60, '01-NOV-2013', 'stock order', 1200);
Insert into SOrder(order_id, stock_id, employee_id, SOname, quantity, order_date, order_description, order_price)
  Values(12, 12, 10, 'order12', 60, '01-NOV-2013', 'stock order', 1200);

--Populate SpecialOrder table, can be populated if Customer and Supplier tables were populated
Insert into SpecialOrder (OrderID, customer_id, supplier_id, OrderDate, Price, OrderAmount, OrderDetail)
  Values(1, 20001, 101, '14-NOV-13', 100, 1, 'Pit Bull');
Insert into SpecialOrder (OrderID, customer_id, supplier_id, OrderDate, Price, OrderAmount, OrderDetail)
  Values(2, 20002, 102, '10-NOV-13', 155, 1, 'Siamese');
  
--Populate CustomerOrder table, can be populated if Customer and Staff tables were populated
Insert into CustomerOrder (COrderID, customer_id, employee_id, Order_date, Price, OrderAmount, OrderDetail)
  Values(1, 20003, 11, '09-NOV-13', 20, 1, 'BOX TURTLE');
Insert into CustomerOrder (COrderID, customer_id, employee_id, Order_date, Price, OrderAmount, OrderDetail)
  Values(2, 20004, 10, '09-NOV-13', 79.95, 5, 'African Grey Species');
  
 -- commit all changes that I did in the database
 COMMIT; 