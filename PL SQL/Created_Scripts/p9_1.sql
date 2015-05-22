spool c:\logs\p9_1.out.lst

/*******************************************************************************
   Take the anonymous block of code and translate to a procedure called EMPLOYEE_SALARIES. 
   Apply a parameter to the procedure to populate based on the title of the employee
********************************************************************************/

/*******************************************************************************
		Script name: p9_1.sql
		Log file: p9_1.out.lst
		Purpose: Take the anonymous block of code and translate to a procedure called EMPLOYEE_SALARIES.
		Author: Cortland Boudreau
		Date: March, 14, 2015
********************************************************************************/

SET SERVEROUTPUT ON
Set echo off

-- Create the procedure


CREATE OR REPLACE PROCEDURE EMPLOYEE_SALARIES
        (empTitle IN VARCHAR2, empSal IN NUMBER)
       
IS
        CURSOR emp_cursor IS
        SELECT EMPLOYEEID, SALARY
        FROM EMPLOYEE
        WHERE TITLE = empTitle;
       
BEGIN

			-- using cursor because multiple records can be returned
        FOR emp_record IN emp_cursor LOOP
                UPDATE EMPLOYEE
                SET SALARY = empSal
                WHERE EMPLOYEEID = emp_record.EMPLOYEEID;
                COMMIT;
        END LOOP;
       
        EXCEPTION
                WHEN OTHERS THEN
                        DBMS_OUTPUT.put_line('Error Updating Employee Records');
       
END EMPLOYEE_SALARIES;
/
-- end of create procedure




-- Selecting so we can see the difference
 SELECT SALARY, TITLE, EMPLOYEEID FROM EMPLOYEE;


 
 

s
  -- Testing function
DECLARE
        title VARCHAR(80) := 'IT Staff'; -- Pushing title IT Staff
        salary NUMBER := 65000; -- Previously 60000
BEGIN
        EMPLOYEE_SALARIES(title, salary);
       
	   
	   
	EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.put_line('Uh.Oh, An error Happened. Contact your Administrator');
END;
/



 



 -- Select now and see the difference
SELECT SALARY, TITLE, EMPLOYEEID FROM EMPLOYEE;
		
		
		
       


spool off;