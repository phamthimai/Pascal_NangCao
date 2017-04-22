Program P110101a;
Uses  Crt;
Const nmax=50;
      inp='INPUT.DAT';
Type  Mang=array [1..nmax,1..nmax] of real;
Var   a,b: Mang;
      n,i,j,k,l: integer;

Procedure Nhap;
Var i,j: integer; f: text;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
   begin
     For j:=1 to n do Read(f,a[i,j]); Readln(f);
   end;
 Close(f);
End;

Procedure Xuat(a: Mang);
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(a[i,j]:8:2); Writeln;
   end;
End;

BEGIN
 Nhap;
 For i:=1 to n do
   For j:=1 to n do
     For k:=1 to n do For l:=1 to n do
       If (k<>i)and(l<>j) then b[i,j]:=b[i,j]+a[k,l];
 Clrscr;
 Xuat(a);
 Writeln;
 Xuat(b);
 Readln;
END.