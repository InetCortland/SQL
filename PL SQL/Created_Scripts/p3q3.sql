spool c:\logs\p3q3.lst

/*******************************************************************************
   Create a PL/SQL block that deletes the GenreId row that you inserted
********************************************************************************/
/*******************************************************************************
		Script name: p3q3.sql
		Log file: p3q3.lst
		Purpose: Create a PL/SQL block that deletes the GenreId row that you inserted
		Author: Cortland Boudreau
		Date: Jan 28, 2015
********************************************************************************/
SET SERVEROUTPUT ON
col NAME Format A20

VARIABLE v_newMediaName varchar2(225);

 accept input_media CHAR prompt 'Please enter new Media Type: '
 
declare 

     v_newMediaName varchar2(225) := '&input_media';
	 v_MediaId number := 5;
	 
	 
begin
	-- call update using input value]
	UPDATE    MediaType
	SET     Name = v_newMediaName
	WHERE   MediaTypeId = v_MediaId;

	
	COMMIT;
	
    SELECT MAX(Name) 
	INTO v_newMediaName
	FROM MediaType;
	
	DBMS_OUTPUT.PUT_LINE ('--------------------------------' || CHR(10) || CHR(10)||'Input Result' || CHR(10) || v_newMediaName  ||  CHR(10)|| CHR(10) || '--------------------------------') ;
  
end;
/

spool off