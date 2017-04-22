Program P110110;   {lap mang 2 chieu}
Uses  Crt;
Const nmax=20;
Type  Mang=array [1..nmax,1..nmax] of integer;
Var   a: Mang;
      n,i,j,k,l,r,t,b: integer;

Procedure Nhap;
Begin
 Write('Nhap so N: '); Readln(N);
End;

Procedure Xuat;
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(a[i,j]:4); Writeln;
   end;
End;

Procedure Xep;
Begin
 Repeat
   a[i,j]:=k; Inc(k);
   If (i=t)and(j<r) then Inc(j)
   Else If (j=r)and(i<b) then Inc(i)
        Else If (i=b)and(j>l) then Dec(j)
             Else If (j=l)and(i>t) then Dec(i);
 Until (i=t)and(j=l);
 Inc(l); Inc(t); Dec(r); Dec(b); i:=t; j:=l;
 If k<=Sqr(n) then Xep;
End;

BEGIN
 Nhap;
 i:=1; j:=1; k:=1; l:=1; r:=n; t:=1; b:=n;
 Xep;
 ClrScr;
 Xuat;
 Readln;
END.
