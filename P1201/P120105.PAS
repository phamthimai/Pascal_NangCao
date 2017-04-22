Program  P120105;   {C(m,n)}
Uses Crt;
Var  m,n: Byte;

Function C(m,n: Byte): Word;
Begin
 If (m=0)or(m>=n) then C:=1
 Else C:=C(m,n-1)+C(m-1,n-1);
End;

BEGIN
 Clrscr;
 Write('Nhap cac so M, N: '); Readln(m,n);
 Write('C(',m,',',n,') = ', C(m,n));
 Readln;
END.
