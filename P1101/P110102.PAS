Program P110102; {Doi cho hang, cot de phan tu max nam o goc trai tren}
Uses  Crt;
Const nmax=50;
      inp='INPUT.DAT';
Type  Mang=array [1..nmax,1..nmax] of real;
Var   a: Mang;
      n,i,j,i1,j1: integer;
      tg: real;

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
 (* Doi cho hang 1 va hang i1 *)
 For i:=1 to n do
 begin
   tg:=a[1,i];
   a[1,i]:=a[i1,i];
   a[i1,i]:=tg;
 end;
 (* Doi cho cot 1 va cot j1 *)
 For i:=1 to n do
 begin
   tg:=a[i,1];
   a[i,1]:=a[i,j1];
   a[i,j1]:=tg;
 end;
 Xuat(a);
 Readln;
END.