Program P120108;
Var Thaydoi: integer;

Function y: integer;
Begin
 If Thaydoi=0 then y:=1
 Else y:=0;
 Thaydoi:=1;
End;

BEGIN
 Thaydoi:=0;
 Writeln(y=y);
 Readln;
END.