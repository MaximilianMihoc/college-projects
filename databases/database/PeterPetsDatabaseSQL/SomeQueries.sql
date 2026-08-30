--Study Case: Peter Pets             
--
--                    Queries


--For each employee, display name, orders and order date that he did.
--Display all employees with the orders they made. For this query, I have to join staff table and sorder table with an inner equijoin 
--and display the required columns using Employee_id.   
--      Inner equijoin
Select staff.employee_name, sorder.soname, sorder.order_date 
from staff
inner join sorder
on (staff.employee_id = sorder.employee_id);

-- Display all elements from stock table with each species even if the stock table contain some elements that don't exists in species table
-- Stock tables contain some elements that do not exist in species table: e.g. tank, cage, food etc. If I use a left outer join,
-- this will display the stock name, species name (if is a specie) and number in stock  
-- left outer join
Select stock.sname,species.species_name, stock.no_in_stock
from stock
left outer join species
on (stock.stock_id = species.stock_id);

--display Species name and price for all species that are under treatment
--right outer join
select species.species_name, species.species_price
from species
right outer join treatment
on (species.species_id = treatment.species_id);

--Display stock name, species name and price for all species that have price less than 50
--non equijoin 
Select stock.sname, species.species_name, species.species_price
from stock
join species
on (species.species_price < 50)
where stock.stock_id = species.stock_id;

--Display all species with all specific instructions for each species.
--natural join
Select *
from species
natural join instruction;

-- Display species that are good to be sold. If a species have a disease, it can not be sold.
--natural join

Select species.species_name, species.species_price
from species
natural join DailyCheck
where (DailyCheck.disease_present = 'N');
 
