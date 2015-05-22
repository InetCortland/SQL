spool c:\logs\p3q4.lst

/*******************************************************************************
   Delete Max Value from Genre
********************************************************************************/
/*******************************************************************************
		Script name: p3q4.sql
		Log file: p3q4.lst
		Purpose: To Select Max GenreID and delete genre
		Author: Cortland Boudreau
		Date: Jan 29, 2015
********************************************************************************/

SET SERVEROUTPUT ON
col NAME Format A20

VARIABLE v_thegenre varchar2(225);
 
declare 

     v_thegenre varchar2(225);
	 v_GenreId number;
	 
begin
	-- Get Max value for GenreID
	SELECT MAX(GenreId) 
	INTO v_GenreId
	FROM Genre;
	
	--Get name value
	SELECT Name
	INTO v_thegenre
	FROM Genre
	WHERE GenreId = v_GenreId;
-- Delete value from table
	DELETE FROM Genre
	WHERE   GenreId = v_GenreId;
	COMMIT;

	DBMS_OUTPUT.PUT_LINE ('--------------------------------' || CHR(10) || CHR(10)||'Deleted Result' || CHR(10) || TO_CHAR(v_GenreId)|| ' ' || v_thegenre || CHR(10)|| CHR(10) || '--------------------------------') ;
  
end;
/

spool off