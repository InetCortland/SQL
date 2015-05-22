SET SERVEROUTPUT ON

accept x number prompt 'Please enter first number: '
accept y number prompt 'Please enter second number: '


declare 
  a number;
   
begin
  a := &x/&y+&y;
    /*
  DBMS_OUTPUT.PUT_LINE ('G_Result');
  DBMS_OUTPUT.PUT_LINE (' ');
  DBMS_OUTPUT.PUT_LINE ('***********');*/
   
  DBMS_OUTPUT.PUT_LINE ( CHR(10) ||'G_Result' || CHR(10) || CHR(10) || '***********' || CHR(10) || TO_CHAR(a));
  
end;
/