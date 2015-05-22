spool c:\logs\p7_1.out.lst

/*******************************************************************************
		Script name: p7_1.sql
		Log file: p7_1.out.lst
		Purpose: Create Message log table
		Author: Cortland Boudreau
		Date: Feb 24, 2015
********************************************************************************/



CREATE TABLE MESSAGE_LOGS
(MESSAGE_DATE Date,SCRIPT_NAME varchar2(25),MESSAGE_RESULT varchar2(100));


Describe Message_Logs;


spool off;