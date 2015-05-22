spool c:\logs\log_create_users.lst


/*******************************************************************************
		Script name: create_users.sql
		Log file: log_create_users.lst
		Purpose: To create users
		Author: Cortland Boudreau
		Date: Jan 13, 2015
********************************************************************************/



	SET timing on
	-- display timing statistics for each SQL command or PL/SQL block run.
	SET TRIMSPOOL ON 
	-- TRIMSPOOL = ON will remove trailing spaces from spooled output
	SET TRIMOUT   ON
	-- TRIMOUT = ON will remove trailing spaces from output
	set echo on
	-- Display commands as they are executed
	set serveroutput on
	-- whether to display the output of stored procedures (or PL/SQL blocks)

	WHENEVER SQLERROR EXIT SQL.SQLCODE
	WHENEVER OSERROR  EXIT 9
	-- trap SQL and PL/SQL errors


	DROP USER DATADEV CASCADE;
	DROP USER DATAQA CASCADE;
	DROP USER DATAPRD CASCADE;
	DROP USER BOUDREAU CASCADE;



	CREATE USER DATADEV
		IDENTIFIED BY dbas2200
		DEFAULT TABLESPACE users 
		QUOTA 10M ON users 
		TEMPORARY TABLESPACE temp;
	 
		
		CREATE USER DATAQA
		IDENTIFIED BY dbas2200
		DEFAULT TABLESPACE users 
		QUOTA 10M ON users 
		TEMPORARY TABLESPACE temp;
	  
		
		CREATE USER DATAPRD
		IDENTIFIED BY dbas2200
		DEFAULT TABLESPACE users 
		QUOTA 10M ON users 
		TEMPORARY TABLESPACE temp;
		
		
		CREATE USER BOUDREAU
		IDENTIFIED BY dbas2200
		DEFAULT TABLESPACE users 
		QUOTA 10M ON users 
		TEMPORARY TABLESPACE temp;
	   

	 select * from all_users where username in ( 'DATADEV', 'DATAQA', 'DATAPRD', 'BOUDREAU');

spool off