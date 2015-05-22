spool c:\logs\p6_2.lst

/*******************************************************************************
   Alter the EMPLOYEE table called SALARY NUMBER(11,2).  Spool out the command used. 
********************************************************************************/
/*******************************************************************************
		Script name: p6_2.sql
		Log file: p6_2.lst
		Purpose: Alter the EMPLOYEE table called SALARY NUMBER(11,2).
		Author: Cortland Boudreau
		Date: Feb 24, 2015
********************************************************************************/
SET SERVEROUTPUT ON


declare 

   CURSOR emp_cur IS 
   SELECT EmployeeId,Title
   FROM Employee;
   
   v_Empid          Chinook.Employee.employeeid%TYPE;
   v_Emptitle        Chinook.Employee.Title%TYPE;
   v_Salary         Chinook.Employee.Salary%TYPE;

 
begin

     OPEN emp_cur ;   -- opens the cursor

     FOR   i  IN   1 .. 8   LOOP
	
            FETCH  emp_cur  INTO   v_Empid, v_Emptitle ; 


			dbms_output.put_line(CHR(10)  ||  TO_CHAR(v_Empid) || ' '|| v_Emptitle );
			
			
			CASE v_Emptitle
			   WHEN 'IT Manager' THEN 
			    --> 85,000  
				UPDATE Employee
				SET Salary = 85000
				WHERE EmployeeId = v_Empid;
				
			   WHEN 'IT Staff' THEN 
			   --> 60,000    
				UPDATE Employee
				SET Salary = 60000 
				WHERE EmployeeId = v_Empid;

			   WHEN 'Sales Manager' THEN 
			   --> 50,000 
			    UPDATE Employee
				SET Salary = 50000 
				WHERE EmployeeId = v_Empid;
				
   			   ELSE 
				--> 35,000 
				UPDATE Employee
				SET Salary = 35000 
				WHERE EmployeeId = v_Empid;

			END CASE;

				commit;	
     END LOOP;
	 
	 
   CLOSE emp_cur ;
end;
/

spool off