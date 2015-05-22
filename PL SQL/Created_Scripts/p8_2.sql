spool c:\logs\p8_2.out.lst

/*******************************************************************************
	   Do Calculation of a date time
	   Test that your function works by spooling the results into a file called p8_2.out
********************************************************************************/
/*******************************************************************************
		Script name: p8_2.sql
		Log file: p8_2.out.lst
		Purpose: Do Calculation of a date time
		Author: Cortland Boudreau
		Date: March 13, 2015
********************************************************************************/

SET SERVEROUTPUT ON



CREATE OR REPLACE FUNCTION 
age (v_dob_in IN DATE)

   RETURN NUMBER
IS
BEGIN
   RETURN SYSDATE - v_dob_in; -- Do Current Time  - (minus) DOB
END age;
/


-- Begin Testing

ACCEPT dob PROMPT 'Enter D.O.B Formatted to : yyyy-mm-dd  :';


DECLARE
	v_BirthDate DATE;
	v_TotalofDaysDifference NUMBER;
	
	
BEGIN
		-- take DOB and format it
	v_BirthDate := TO_DATE('&dob', 'YYYY/MM/DD');
	v_TotalofDaysDifference := age(v_BirthDate);  -- call function
	DBMS_OUTPUT.put_line('The difference from now and your DOB is : ' || to_char( v_TotalofDaysDifference, '99999' ) || ' days' ); --output

	EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.put_line('You entered the wrong kind of Date for your birth.');
end;
/

spool off;	