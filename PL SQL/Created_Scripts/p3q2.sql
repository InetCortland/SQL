spool c:\logs\p3q2.lst

/*******************************************************************************
   Add new Genre using +10 maxGenereID for the new ID
********************************************************************************/
/*******************************************************************************
		Script name: p3q2.sql
		Log file: p3q2.lst
		Purpose: To Select Max GenreID and insert new genre
		Author: Cortland Boudreau
		Date: Jan 28, 2015
********************************************************************************/
SET SERVEROUTPUT ON
col NAME Format A20

VARIABLE v_thegenre varchar2(225);

 accept input_genre CHAR prompt 'Please enter new Genre Name: '
 
declare 

     v_thegenre varchar2(225) := '&input_genre';
	 v_GenreId number;
	 
begin

	-- Get Max value for GenreID
	SELECT MAX(GenreId) 
	INTO v_GenreId
	FROM Genre;
	
	-- Add 10 to max value for GenreID
	v_GenreId := v_GenreId+10;
	
	--Insert into Genre using the new ID and the input value
	INSERT INTO Genre (GenreId, Name)
	VALUES       (v_GenreId,v_thegenre);
	
	COMMIT;
	
	
  --DBMS_OUTPUT.PUT_LINE ('--------------------------------' || CHR(10) || CHR(10)||'Result' || CHR(10) || TO_CHAR(v_GenreId) || v_thegenre ||  CHR(10)|| CHR(10) || '--------------------------------') ;
  
end;
/

spool off