create table item_sales1(
item_sales_id int,
item_name varchar(20),
sales_date date primary key,
sales_price int);
create table item_discount1(
item_dis_id int,
item_name varchar(20),
discount_price int,
sales_datefrom date,
sales_dateto date);

insert into item_sales1 values(1,'Apple','2022/11/1',50);
insert into item_sales1 values(1,'Apple','2022/12/10',50);
insert into item_sales1 values(2,'pear','2022/12/31',100);
insert into item_sales1 values(2,'pear','2022/12/3',100);
insert into item_sales1 values(3,'grapes','2022/3/3',200);
insert into item_discount1 values(1,'Apple',10,'2022/12/1','2022/12/31');
insert into item_discount1 values(2,'pear',20,'2022/12/1','2022/12/5');

select s.item_sales_id,s.item_name,s.sales_date,
case 
    when s.sales_date>=d.sales_datefrom and s.sales_date<=d.sales_dateto
    then s.sales_price-d.discount_price
    else s.sales_price end
as overallprice
from item_sales1 as s
left join item_discount1 as d
on s.item_sales_id=d.item_dis_id
order by s.item_sales_id;














