Program P110103;
{ptu max nam o goc trai tren, ptu min o goc phai duoi}
Uses  Crt;
Const nmax=50;
      inp='INPUT.DAT';
Type  Mang=array [1..nmax,1..nmax] of real;
Var   a: Mang;
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

Procedure Xuat(a: Mang);
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(a[i,j]:8:2); Writeln;
   end;
End;

Procedure Doihang(k,l: integer);
Var i: integer; tg: real;
Begin
 For i:=1 to n do
 begin
   tg:=a[k,i]; a[k,i]:=a[l,i]; a[l,i]:=tg;
 end;
End;

Procedure Doicot(k,l: integer);
Var i: integer; tg: real;
Begin
 For i:=1 to n do
 begin
   tg:=a[i,k]; a[i,k]:=a[i,l]; a[i,l]:=tg;
 end;
End;

BEGIN
 Nhap;
 ClrScr;
 Xuat(a);
 Writeln;
 (* Tim phan tu lon nhat *)
 i1:=1; j1:=1;
 For i:=1 to n do
   For j:=1 to n do
     If a[i1,j1]<a[i,j] then
     begin
       i1:=i; j1:=j
     end;
 Doihang(1,i1); Doicot(1,j1);
 (* Tim phan tu nho nhat *)
 i1:=1; j1:=1;
 For i:=1 to n do
   For j:=1 to n do
     If a[i1,j1]>a[i,j] then
     begin
       i1:=i; j1:=j
     end;
 If (i1=1) then
 begin
   Writeln('Khong thuc hien duoc vi max va min cung hang');
   Readln; Halt;
 end;
 If (j1=1) then
 begin
   Writeln('Khong thuc hien duoc vi max va min cung cot');
   Readln; Halt;
 end;
 Doihang(n,i1); Doicot(n,j1);
 Xuat(a);
 Readln;
END.