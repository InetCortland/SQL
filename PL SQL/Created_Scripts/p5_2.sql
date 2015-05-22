spool c:\logs\p5_2_output.lst

/*******************************************************************************
a. Declare a PL/SQL record based on the structure of the INVOICE table. 
b. Use a SQLPlus substitution variable to retrieve all information about a specific invoice and store that information into the PL/SQL record. 
c. Use DBMS_OUTPUT.PUT_LINE and print selected information about the invoice. 
d.Save the file as p5_2.sql 
e. Spool the output that is being printed to the screen as p5_2_output.lst. 
f. Use InvoiceId = 274 or 275 to test your block
********************************************************************************/

/*******************************************************************************
		Script name: p5_2.sql
		Log file: p5_2_output.lst
		Purpose: Create a PLSQL block to print information about a given invoice 
		Author: Cortland Boudreau
		Date: Feb 20 2015
********************************************************************************/
SET SERVEROUTPUT ON

declare 


					
					
	TYPE Invoice_Record IS Record 
			(	InvoiceId NUMBER ,
				CustomerId NUMBER ,
				InvoiceDate DATE ,
				BillingAddress VARCHAR2(70),
				BillingCity VARCHAR2(40),
				BillingState VARCHAR2(40),
				BillingCountry VARCHAR2(40),
				BillingPostalCode VARCHAR2(10),
				Total NUMBER(10,2) );

	invoicerecord Invoice_Record;







	
begin
				--Into invoicerecord.InvoiceId, invoicerecord.CustomerId, invoicerecord.InvoiceDate, invoicerecord.BillingAddress, invoicerecord.BillingCity, invoicerecord.BillingState, invoicerecord.BillingCountry, invoicerecord.BillingPostalCode, invoicerecord.Total
					
					-- invoiceid,customerid,invoicedate,billingaddress,billingcity,billingstate,billingcountry,billingpostalcode,total 
					
					Select invoiceid,customerid,invoicedate,billingaddress,billingcity,billingstate,billingcountry,billingpostalcode,total
					INTO invoicerecord
					From Invoice
					Where InvoiceId = 275 ;

					
					
					
			
	dbms_output.put_line(CHR(10) ||'InvoiceID:    ' || invoicerecord.InvoiceId );
	dbms_output.put_line('InvoiceTotal: ' || invoicerecord.Total);
	dbms_output.put_line(' CustomerId:   ' || invoicerecord.CustomerId);
    dbms_output.put_line('Date:         ' || invoicerecord.InvoiceDate);
	dbms_output.put_line('Address:      ' || invoicerecord.BillingAddress);
	dbms_output.put_line('City:         ' || invoicerecord.BillingCity);
	dbms_output.put_line('State:        ' || invoicerecord.BillingState);
	dbms_output.put_line('PostalCode:   ' || invoicerecord.BillingPostalCode);
end;
/

spool off