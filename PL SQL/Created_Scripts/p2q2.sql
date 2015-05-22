SET SERVEROUTPUT ON

accept v_sal number prompt 'Please enter the salary amount: '
accept v_bonus number prompt 'Please enter the bonus percentage: '

declare 
  v_final number;
  v_fixed number;
  v_fixedBonus number;
     
begin

	v_fixed := &v_sal;
	v_fixed  :=NVL(&v_sal, 0 );
	v_fixedBonus := &v_bonus/100;
	v_final := v_fixed * v_fixedBonus;
	v_final := v_final + v_fixed;
   
  DBMS_OUTPUT.PUT_LINE ( CHR(10) ||'G_Result' || CHR(10) || CHR(10) || '***********' || CHR(10) || TO_CHAR(v_final));
  
end;
/

