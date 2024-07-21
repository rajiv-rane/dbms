create table Employee(E_id int,E_name varchar(30),Age int,Salary int);

insert into Employee VALUES(1,'A',30,50000),(2,'B',25,45000),(3,'C',35,60000),(4,'D',28,48000),(5,'E',32,55000);


DELIMITER //
CREATE PROCEDURE fetch_employee_data()
BEGIN
   DECLARE emp_id int;
   DECLARE emp_name varchar(100);
   DECLARE emp_age int;
   DECLARE emp_salary int;
   DECLARE done boolean default FALSE;
   DECLARE emp_cursor CURSOR for
   SELECT E_id,E_name,Age,Salary from Employee;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =TRUE;
   open emp_cursor;
   emp_loop: LOOP
       fetch emp_cursor into emp_id,emp_name,emp_age,emp_salary;
       if done then
           LEAVE emp_loop;
       end if;
       SELECT CONCAT('Employee ID:',emp_id,',Name:',emp_name,',Age:',emp_age,',Salary:',emp_salary);
   end LOOP emp_loop;
   close emp_cursor;
END //
DELIMITER ;

CALL fetch_employee_data();