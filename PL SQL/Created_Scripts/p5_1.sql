spool c:\logs\p5_1_output.lst

/*******************************************************************************
 a. Declare a PL/SQL table, MY_GENRE_TABLE, to temporarily store the name of the genres. 
 b. Using a loop, retrieve the name of all genres and store them in the PL/SQL table. 
 c. Using another loop, retrieve the genre names from the PL/SQL table and print them to the screen, using DBMS_OUTPUT.PUT_LINE. 
********************************************************************************/

/*******************************************************************************
		Script name: p5_1.sql
		Log file: p5_1_output.lst
		
		Purpose: Create a PL/SQL block to retrieve the name of each genre from the GENRE table and print each genre to the screen incorporating a PL/SQL table.
		
		Author: Cortland Boudreau
		Date: Feb 20 2015
********************************************************************************/
SET SERVEROUTPUT ON


declare 


	TYPE MY_GENRE_TABLE IS TABLE OF 
		chinook.Genre.Name%TYPE NOT NULL
		INDEX BY BINARY_INTEGER; 
		
	
	genreTable MY_GENRE_TABLE; -- Created variable of type My genre Table
	v_genreMin int;
	v_genreMax int;
	v_counter int;
	v_genreID int;
	v_rowcount int;
	v_index int;
	v_genreName VARCHAR2(20);
	
begin



		-- get min genreid
	SELECT MIN(GenreId)
	 INTO v_genreMin
	 FROM Genre;

		-- get max genre id
	SELECT MAX(GenreId) 
	INTO v_genreMax
	FROM Genre;

				v_index := 1;
				v_counter :=1;
			   LOOP
						--Validation for rowcount to ensure we get a result back.
						-- This can cause problems otherwise because we have skipped ID's
					select count(*) into v_rowcount from chinook.Genre where GenreId = v_counter;
				
									-- if the rowcount is not 0
							  if v_rowcount != 0 then
							  	Select Name 
									INTO  v_genreName
									FROM GENRE
									WHERE GenreId = v_counter;
									
									--dbms_output.put_line('Genre Name: ' || v_genreName);
									-- Here we put the name into the Genre Table with Index value
									genreTable(v_index) := v_genreName;
									v_index := v_index + 1;

							  end if;

						v_counter  := v_counter+1;
					EXIT WHEN  v_counter  > v_genreMax;
				END LOOP;

				 -- Output that the table was loaded into the temp table
				dbms_output.put_line( CHR(10) || 'All Genres Loaded into Table' || CHR(10));
				
				-- Reset our counter
				v_counter :=1;
				
				-- 2ND LOOP FOR OUTPUT FROM TABLE
			LOOP
				dbms_output.put_line( 'From Table: ' || genreTable(v_counter));
					v_counter  := v_counter+1;
										-- using Table.count to get the total
				EXIT WHEN  v_counter  > genreTable.COUNT;
			END LOOP;

end;
/

spool off