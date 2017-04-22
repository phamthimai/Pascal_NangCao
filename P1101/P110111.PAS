Program P110111;   {Lap mang moi bang doi cho cac khoi}
Uses  Crt;
Const nmax=50;
      inp='INPUT.DAT';
Type  Mang=array [1..nmax,1..nmax] of real;
Var   a,b: Mang;
      n,i,j: integer;

Procedure Nhap;
Var i,j: integer; f: text;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to 2*n do
   begin
     For j:=1 to 2*n do Read(f,a[i,j]); Readln(f);
   end;
 Close(f);
End;

Procedure Xuat(a: Mang);
Var i,j: integer;
Begin
 For i:=1 to 2*n do
   begin
     For j:=1 to 2*n do Write(a[i,j]:8:2); Writeln;
   end;
End;

BEGIN
 Nhap;
 For i:=1 to n do
   For j:=1 to n do
   begin
     b[i,j]:=a[i+n,j];
     b[i,j+n]:=a[i,j];
     b[i+n,j+n]:=a[i,j+n];
     b[i+n,j]:=a[i+n,j+n];
   end;
 ClrScr;
 Xuat(a);
 Writeln;
 Xuat(b);
 Readln;
END.