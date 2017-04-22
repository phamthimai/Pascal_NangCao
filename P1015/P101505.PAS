Program P101505;  {Dan so}
Uses Crt;
Var  n:integer;

Function DanSo(nam:integer):real;
Begin
 If (nam=1995) Then DanSo:=7
 Else DanSo:=1.03*DanSo(nam-1);
End;

BEGIN
 Clrscr;
 Write('Dan so the gioi nam 2010 la  ',DanSo(2010):0:3,' ty nguoi');
 Readln;
END.