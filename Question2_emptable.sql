
create or alter procedure tab (@var reftable readonly)
as 
begin
declare @i int=1 ,@len int;
	select @len=Count(*) from @var
	while @i<=@len
	begin 
		if exists(select emp_id from employee where emp_id=(select id from @var where serial_num=@i))
			begin 
			update employee set employee.emp_name=(select name from @var where serial_num=@i),employee.salary=(select sal from @var where serial_num=@i)
			where employee.emp_id=(select id from @var where serial_num=@i)
			end
		else 
			begin insert into employee(emp_id,emp_name,salary) 
			select id,name,sal from @var
		end
		set @i=@i+1;
	end
end
create table employee(
emp_id int,
emp_name varchar(50),
salary int);
create type reftable as table
(id int,name varchar(20),sal int,serial_num int identity(1,1));
declare @obj1 as reftable
insert into @obj1 values(1,'naruto',100000)
insert into @obj1 values(2,'tony',60000)
insert into @obj1 values(3,'midoriya',80000)
exec tab @obj1
select * from Employee;
--testing by entering already entered values
declare @obj2 as reftable
insert into @obj2 values(1,'naruto',200000)
insert into @obj2 values(2,'kakashi',150000)
exec tab @obj2
select * from employee;






