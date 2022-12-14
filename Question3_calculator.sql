alter proc calculator
@num1 int,
@num2 int,
@operation varchar(15),
@result varchar(50) output
as begin
begin try
    if @operation='a'
        set @result=CONCAT('the sum of two numbers is  ',(@num1+@num2))
    else if @operation='s'
        set @result=CONCAT('the difference of two numbers is  ',(@num1-@num2))
    else if @operation='p'
        set @result=CONCAT('the product of two numbers is  ',(@num1*@num2))
    else if @operation='d'
        begin try
          set @result=CONCAT('the division of two numbers is  ',(@num1/@num2))
        end try
        begin catch
        print 'division by zero error occured'
        end catch
end try
begin catch
print 'invalid operation'
end catch
end

declare @res varchar(50);
exec calculator 17,20,'s',@res output
print @res






