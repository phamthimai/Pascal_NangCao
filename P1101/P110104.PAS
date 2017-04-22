Program P110104; {Loai hang, cot co chua phan tu co tri tuyet doi lon nhat}
Uses  Crt;
Const nmax=50;
      inp='INPUT.DAT';
Type  Mang=array [1..nmax,1..nmax] of real;
Var   a,b: Mang;
      n,i,j,i1,j1: integer;

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

Procedure Xuat(n: integer; a: Mang);
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(a[i,j]:8:2); Writeln;
   end;
End;

BEGIN
 Nhap;
 (* Tim phan tu co tri tuyet doi lon nhat *)
 i1:=1; j1:=1;
 For i:=1 to n do
   For j:=1 to n do If abs(a[i1,j1])<abs(a[i,j]) then
   begin
     i1:=i; j1:=j
   end;
 (* Lap ma tran moi *)
 For i:=1 to n-1 do
   For j:=1 to n do
     If i<i1 then b[i,j]:=a[i,j]
     Else         b[i,j]:=a[i+1,j];
 For i:=1 to n-1 do
   For j:=j1 to n-1 do b[i,j]:=b[i,j+1];
 ClrScr;
 Xuat(n,a);
 Writeln;
 Xuat(n-1,b);
 Readln;
END.