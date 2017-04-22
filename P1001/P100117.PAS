Program P100117;  {Tim USCLN cua 2 so nhap tu ban phim}
Uses Crt;
Var  m,n: integer;

Function US(a,b: integer): integer;
Begin
 While a<>b do
   If a>b then a:=a-b Else If b>a then b:=b-a;
 US:=a;
End;

BEGIN
 Clrscr;
 Write('Nhap hai so nguyen duong M,N: '); Readln(m,n);
 Write(US(m,n));
 Readln;
END.