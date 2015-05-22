spool c:\logs\p6_3.lst

/*******************************************************************************
   Create a PL/SQL block that determines the top employees with respect to salaries. 
********************************************************************************/
/*******************************************************************************
		Script name: p6_3.sql
		Log file: p6_3.lst
		Purpose: Create a PL/SQL block that determines the top employees with respect to salaries.
		Author: Cortland Boudreau
		Date: Feb 25, 2015
********************************************************************************/
SET SERVEROUTPUT ON


declare 

   CURSOR emp_cur IS 
   SELECT Salary, LastName
   FROM Employee
   ORDER BY Salary desc;
   
   v_Emplname        Chinook.Employee.LastName%TYPE;
   v_Salary         Chinook.Employee.Salary%TYPE;

begin

     OPEN emp_cur ;   -- opens the cursor
     FOR   i  IN   1 .. 5   LOOP
	
            FETCH  emp_cur  INTO   v_Salary , v_Emplname ; 

			dbms_output.put_line(CHR(10)  ||  TO_CHAR(v_Salary) || ' '|| v_Emplname );
			
			INSERT INTO TOP_Employees (Name, Salary)
			VALUES (v_Emplname,v_Salary); 

			commit;
			
     END LOOP;
	 
	close emp_cur;
end;
/

spool off