spool c:\logs\lab4q1.lst

/*******************************************************************************
Create a PLSQL block that rewards every customer for every $5 dollars spent up to a maximum $20.

Save script as lab4q1.sql.  Include comments in your code

Append an asterisk to the customer.rewards column for every $5 dollars spent.  For example, if the customer has 
 spent $5.98, the customer would be one asterisk added the reward column.
 
You may have to update the rewards column - as the customer has made several purchases.

Test the block for customers who have no purchases and customers for at least one purchase.  Spool out the steps you used to validate your code.
********************************************************************************/
/*******************************************************************************
		Script name: lab4q1.sql
		Log file: lab4q1.lst
		Purpose: Make Edits to the customer.rewards col
		Author: Cortland Boudreau
		Date: Feb 4, 2015
********************************************************************************/
SET SERVEROUTPUT ON

declare 
	-- customer values that we populate with our loop
	 v_customerid number;
	 v_customertotal number;
	 v_customeridMAX number;
	 v_rewardTotal varchar(255);
	 v_customeridMIN number;
 	-- Reward Values, 5 being one * for every 5$, and 20 being the max number of dollars counted. AKA four * (****)

	 /*
	 We need to loop through all the customers..
	 Get Max customer ID field, loop through each customer id in the invoice table
	 return the values into a variable and then insert into the rewards column
	 */
	 
begin


	-- Get Min value for Customerid and use this value to loop towards the max value.
	SELECT MIN(CustomerId)
	 INTO v_customeridMIN
	 FROM Customer;

	-- Get Max value for Customerid
	SELECT MAX(CustomerId) 
	INTO v_customeridMAX
	FROM Customer;
	
	
	-- Now that we have the max Cus Id we can loop towards it. 1 to max ID
	
	   LOOP
				v_customertotal :=0;

				SELECT SUM (Total)
				INTO v_customertotal
				FROM Invoice
				WHERE CustomerId = v_customeridMIN; 				
				
					-- This Tests the block for customers who have no purchases and customers for at least one purchase.
					-- Because only cases where the total is > then 5.00 AKA 1 or more purchases going to a total of 5$ get any kind of 
					-- Update run against them.
					
					CASE 
							-- Checks each case to apply a star based on customer total spent
						WHEN v_customertotal >= 5.00 and v_customertotal < 10.00 THEN 
							UPDATE Customer
							SET Rewards = '*'
							WHERE CustomerId = v_customeridMIN;
						
						DBMS_OUTPUT.PUT_LINE (TO_CHAR(v_customeridMIN)|| ' ' || TO_CHAR(v_customertotal) || ' ' || '*');
						
						WHEN v_customertotal >=10.00 and v_customertotal < 15.00 THEN
							UPDATE Customer
							SET Rewards = '**'
							WHERE CustomerId = v_customeridMIN;
						
							DBMS_OUTPUT.PUT_LINE (TO_CHAR(v_customeridMIN)|| ' ' || TO_CHAR(v_customertotal) || ' ' || '**');
							
						WHEN v_customertotal >= 15.00 and v_customertotal < 20.00 THEN
						
							UPDATE Customer
							SET Rewards = '***'
							WHERE CustomerId = v_customeridMIN;
						
							DBMS_OUTPUT.PUT_LINE (TO_CHAR(v_customeridMIN)|| ' ' || TO_CHAR(v_customertotal) || ' ' || '***');
							
						WHEN v_customertotal >= 20.00 THEN
						
							UPDATE Customer
							SET Rewards = '****'
							WHERE CustomerId = v_customeridMIN;
							DBMS_OUTPUT.PUT_LINE (TO_CHAR(v_customeridMIN) || ' ' || TO_CHAR(v_customertotal) || ' ' || '****');
					END CASE;
			
					  COMMIT;
				v_customeridMIN  := v_customeridMIN+1;
				
			EXIT WHEN  v_customeridMIN  = v_customeridMAX;
		END LOOP;

end;
/

spool off