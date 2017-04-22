Program P110112;
Uses  Crt;
Const nmax=11;
Type  Mang=array [1..nmax,1..nmax] of integer;
Var   a,b: Mang;
      n,i,j,hang: integer;

Procedure Nhap;
Begin
 Write('Nhap so N: '); Readln(N);
End;

Procedure Xuat(a: Mang);
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(a[i,j]:4); Writeln;
   end;
End;

BEGIN
 Nhap;
 {Truong hop mot}
 For i:=1 to n do
   For j:=1 to n do
     If i=j then a[i,j]:=1 Else a[i,j]:=0;
 {Truong hop hai}
 For i:=1 to n do
   For j:=1 to n do
     If i=n+1-j then b[i,j]:=i Else b[i,j]:=0;
 ClrScr;
 Xuat(a);
 Writeln;
 Xuat(b);
 Readln;
END.