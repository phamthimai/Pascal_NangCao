Program P101506;     {1/(1+1/(3+1/(1/5))}
Uses  Crt;
Const max=103;
Var   i: integer;

Function DQ(i: integer): real;
Begin
 If i=max then DQ:=max
 Else DQ:=(i+1/DQ(i+2))
End;

BEGIN
 Clrscr;
 Write('Gia tri cua bieu thuc= ',1/DQ(1));
 Readln;
END.