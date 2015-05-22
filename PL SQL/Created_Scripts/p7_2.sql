spool c:\logs\p7_2.out.lst

/*******************************************************************************
   Add new Genre using +10 maxGenereID for the new ID
********************************************************************************/
/*******************************************************************************
		Script name: p7_2.sql
		Log file: p7_2.lst
		Purpose: To Select Max GenreID and insert new genre
		Author: Cortland Boudreau
		Date: Feb 25, 2015
********************************************************************************/


SET SERVEROUTPUT ON


VARIABLE v_salary varchar2(225);

 accept input_sal CHAR prompt 'Please enter Salary Amt: '
 
declare 

	v_rowcount int;
	e_invalid_row   EXCEPTION;
    v_salary Chinook.Employee.Salary%TYPE := &input_sal;
	v_Lastname varchar2(50);
	   v_error_code NUMBER;
   v_error_message VARCHAR2(255);

	 
begin

	
	--Get the Salary
	SELECT LastName 
	INTO v_Lastname
	FROM Employee
	Where Salary = v_salary;
	
	-- Get total number of rows returned
	select count(*) into v_rowcount from chinook.Employee where Salary = v_salary;
				
									-- if the rowcount is not 0
							  if v_rowcount = 1 then
							  RAISE e_invalid_row;
							  
							  end if;
		
 	
	
	EXCEPTION
	
         WHEN TOO_MANY_ROWS THEN
		 	 INSERT INTO Chinook.MESSAGE_LOGS
			 VALUES (CURRENT_DATE, 'p7_2.sql', 'More than one employee with a salary of ' || TO_CHAR(v_salary) );
			 
			 
			 
			 
			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '----Error__Exception------');
			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '--------------------------------');
			 DBMS_OUTPUT.PUT_LINE (' Your SELECT statement retrieved multiplerows. Consider using a cursor.');
			 COMMIT;
			 
		WHEN e_invalid_row THEN

			 INSERT INTO Chinook.MESSAGE_LOGS
			 VALUES (CURRENT_DATE, 'p7_2.sql', 'One row returned  ' ||  v_Lastname  || '   ' || TO_CHAR(v_salary) );
			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '----Error__Exception------');
			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '--------------------------------');
			 DBMS_OUTPUT.PUT_LINE (' Your SELECT statement retrieved 1 row.');
			 COMMIT;
			 
		WHEN NO_DATA_FOUND THEN
        	 INSERT INTO Chinook.MESSAGE_LOGS
			 VALUES (CURRENT_DATE, 'p7_2.sql' , 'No employee with a salary of ' || TO_CHAR(v_salary) );

			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '----Error__Exception------');
			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '--------------------------------');
			 DBMS_OUTPUT.PUT_LINE ('  Your SELECT statement retrieved 0 row(s).');
			 COMMIT;
		When Others THEN 
		
			ROLLBACK;
			v_error_code   := SQLCODE;
			v_error_message   := SQLERRM; 
		    INSERT INTO Chinook.MESSAGE_LOGS
			VALUES (CURRENT_DATE, 'p7_2.sql' ,'Some other error occurred' );

			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '----Error__Exception------');
			 DBMS_OUTPUT.PUT_LINE ( CHR(10) || '--------------------------------');
			 DBMS_OUTPUT.PUT_LINE ('Some other error occurred.');
        COMMIT;
end;
/
		Select * from MESSAGE_LOGS;




spool off