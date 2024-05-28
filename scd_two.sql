-- create a stage table
CREATE TABLE stg_customer_dim2 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255),
    load_date DATE
);

-- load data to stage table 
INSERT INTO stg_customer_dim2 (customer_id, customer_name, email, address, load_date) VALUES
(1, 'John Karpe', 'johndoe@email.com', '123 Main St, Anytown, USA', '2024-03-19'),
(2, 'Jane Smith', 'janesmith@email.com', '456 Elm St, Othertown, USA', '2024-03-19'),
(3, 'Alice Johnson', 'alice@email.com', '789 Oak St, Anycity, USA', '2024-03-19'),
(4, 'Bob Williams', 'bob@email.com', '321 Pine St, Anothercity, USA', '2024-03-19'),
(5, 'nitish', 'bob@email.com', '321 Pine St, Anothercity, USA', '2024-03-19'),
(6, 'ajay', 'bob@email.com', '321 Pine St, Anothercity, USA', '2024-03-19'),
(7, 'bhavya', 'sarahlee@email.com', '654 Maple St, Somecity, USA', '2024-03-19');


-- create a dim table
CREATE TABLE customer_dim2 (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255),
    is_active VARCHAR(2),
    load_date DATE
);

-- create PROCEDURE scd2_customer_dim 
-- as 
-- begin
-- create a temp table 
CREATE TABLE #transformed_source (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255),
    is_active VARCHAR(2),
    load_date DATE
);
-- transformation of source, into temp table
insert into #transformed_source SELECT customer_id,customer_name,email,address,'y' as is_active,load_date from stg_customer_dim2

-- we can use simple update too, but i am using merge to cover any complex scenario if occurs
-- update the old isactive and add new
merge customer_dim2 as target
using #transformed_source as source
on target.customer_id=source.customer_id and target.is_active='y'
when matched then 
update set is_active='n';
-- insert new
insert into customer_dim2 select customer_id,customer_name,email,address,is_active,load_date from #transformed_source;

-- truncate stage
truncate table stg_customer_dim2
-- drop temp table
drop TABLE #transformed_source

select * from customer_dim2;
-- end;

exec scd2_customer_dim;
truncate table customer_dim2;
select * from stg_customer_dim2;