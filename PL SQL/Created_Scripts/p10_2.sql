spool c:\logs\p10_2.out.lst

/*******************************************************************************
   Create a trigger on the customer table. Each time there are changes (updates, deletes, inserts) to data in the customer table
   for the following columns: ADDRESS, CITY, STATE, SUPPORTREPID. 
********************************************************************************/
/*******************************************************************************
		Script name: p10_2.sql
		Log file: p10_2.out.lst
		Purpose: Create a trigger on the customer table.
		Author: Cortland Boudreau
		Date: Feb March 14, 2015
********************************************************************************/
SET SERVEROUTPUT ON
column CUSTOMERID format a40
column City format a20
column Address format a20
column State format a20
column FirstName format a20

-- Creating the Trigger

CREATE OR REPLACE TRIGGER AUD_CUST
	BEFORE
		INSERT OR
		UPDATE OR
		DELETE OF Address, City, State, Supportrepid
	ON Customer
	FOR EACH ROW
	
	-- If statements make things easy, Inserting, Updating, Deleting as per the Instructions
	--If one gets hit we simply insert the new Data into the Aud_Customer as well as System Date for a time stamp
BEGIN

	IF INSERTING THEN
		INSERT INTO AUD_CUSTOMER
		VALUES (:NEW.CustomerID, :NEW.FirstName, :NEW.LastName, :NEW.Company, :NEW.Address, :NEW.City, :NEW.State, :NEW.Country, :NEW.PostalCode, :NEW.Phone, :NEW.Fax, :NEW.Email, :NEW.Supportrepid,:NEW.Rewards, SYSDATE);
		
	ELSIF UPDATING THEN
		INSERT INTO AUD_CUSTOMER VALUES (:OLD.CustomerID, :OLD.FirstName, :OLD.LastName, :OLD.Company, :OLD.Address, 
		:OLD.City, :OLD.State, :OLD.Country, :OLD.PostalCode, :OLD.Phone, :OLD.Fax, :OLD.Email, :OLD.Supportrepid,:OLD.Rewards, SYSDATE);
		
	ELSIF DELETING THEN
		INSERT INTO AUD_CUSTOMER VALUES (:OLD.CustomerID, :OLD.FirstName, :OLD.LastName, :OLD.Company, :OLD.Address,
		:OLD.City, :OLD.State, :OLD.Country, :OLD.PostalCode, :OLD.Phone, :OLD.Fax, :OLD.Email, :OLD.Supportrepid,:OLD.Rewards, SYSDATE);
	
	
	END IF;
END AUD_CUST;
/



  -- Do an Insert to check that the trigger fires
INSERT INTO Customer (CustomerID,FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, Supportrepid, Rewards )
VALUES (100,'George', 'Costanza', 'Sanalac', '500 Main', 'Dartmouth', 'NS', 'Canada', 'B3H9J2', '99521', '99521', 'George@gmail.com' , 1 , '****');

-- Select from Normal Customer Table
SELECT CustomerID, FirstName, Address FROM Customer
WHERE ROWNUM <= 1
ORDER BY CustomerID DESC;



-- Select from Aud Table
SELECT FirstName, Address, City FROM AUD_CUSTOMER;





-- ********** Do an Update to check that the trigger fires *************
UPDATE Customer
SET Address = 'Newadd', City = 'NewYork', State = 'Ny', Supportrepid = 3
WHERE CustomerID = 100;



-- Select from Normal Customer Table
SELECT CustomerID, FirstName, Address, City FROM Customer
WHERE ROWNUM <= 1
ORDER BY CustomerID DESC;


-- Select from Aud Table
SELECT FirstName, Address FROM AUD_CUSTOMER
WHERE Address = '500 Main';





-- ********** Do a Delete to check that the trigger fires *************

DELETE FROM Customer
WHERE CustomerID = 100;



--Select from normal table
SELECT CustomerID, FirstName, Address FROM Customer
WHERE ROWNUM <= 1
ORDER BY CustomerID DESC;

-- Select from Aud Table
SELECT FirstName, Address FROM AUD_CUSTOMER
WHERE Address = 'Newadd';

spool off