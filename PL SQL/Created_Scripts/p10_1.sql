spool c:\logs\p10_1.out.lst

/*******************************************************************************
	   Create a new table called AUD_CUSTOMER duplicating the same structure as the customer table,
	   Test that your function works by spooling the results into a file called p10_1.out
********************************************************************************/
/*******************************************************************************
		Script name: p10_1.sql
		Log file: p10_1.out.lst
		Purpose: Create a new table called AUD_CUSTOMER duplicating the same structure as the customer table
		Author: Cortland Boudreau
		Date: March 14, 2015
********************************************************************************/

SET SERVEROUTPUT ON

 -- Create Table AUD_CUSTOMER
 
CREATE TABLE AUD_CUSTOMER 
	AS (SELECT * FROM Customer WHERE 1=2);
	
	
	-- Alter table to add new column
ALTER TABLE AUD_CUSTOMER
ADD audit_date DATE;
	
	
	
	-- Describe table to get details
DESC AUD_CUSTOMER;




spool off;	