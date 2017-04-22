Program P100113;    {So sanh do C va do F}
Uses Crt;
Var  i,C: integer;

BEGIN
 Clrscr;
 Writeln('     So sanh thang do C va thang do F:');
 Writeln;
 For i:=1 to 5 do Write('    Do C    Do F');
 Writeln;
 For C:=0 to 100 do Write(C:8, (9/5)*C+32:8:2);
 Readln;
END.