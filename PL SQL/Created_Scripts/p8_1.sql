spool c:\logs\p8_1.out.lst

/*******************************************************************************
	   Create a function to determine the number of days between two date’s values.
********************************************************************************/
/*******************************************************************************
		Script name: p8_1.sql
		Log file: p8_1.out.lst
		Purpose: Determine if the last character of a string is a number.
		Author: Cortland Boudreau
		Date: March 6, 2015
********************************************************************************/
SET SERVEROUTPUT ON


CREATE OR REPLACE FUNCTION LAST_CHK( string_in IN VARCHAR2 ) 
RETURN VARCHAR2 
IS
	ResultReturn VARCHAR2(80);
BEGIN

						-- We simply  cut the string down to the last char (  -1)
	CASE SUBSTR (string_in, -1 ) 
						-- we then do cases for 0..9 and set the answer
		WHEN '1' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '2' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '3' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '4' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '5' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '6' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '7' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '8' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '9' THEN ResultReturn := 'Input Strings Last Char is a number';
		WHEN '0' THEN ResultReturn := 'Input Strings Last Char is a number';
		ELSE ResultReturn := 'Input Strings Last Char is a Letter';
		
	END CASE;
					
	RETURN ResultReturn;
END LAST_CHK;
/





ACCEPT input_string PROMPT 'Please enter a String: ';


DECLARE


	v_unformattedstr VARCHAR2(80);
	v_formattedstr VARCHAR2(80);

BEGIN

	v_unformattedstr := '&input_string'; -- we take the input string and assign to var
	v_formattedstr := LAST_CHK(v_unformattedstr);  -- we then call last_chk function
	DBMS_OUTPUT.put_line(v_formattedstr);
	
	
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.put_line('Error, Wrong Data.');
END;
/


spool off