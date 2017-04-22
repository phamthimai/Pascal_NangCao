Program P121405;   {Lap cach goi dien thoai cua N nguoi}
Uses  Crt;
Const fg ='P121405.out';
      max=1000;
Var   f: text;
      n:integer;
      tt,tt1: array [0..max] of byte;
      sp,sl : integer;
      ketthuc: boolean;

Procedure Nhap;
Begin
 Write('N = '); Readln(n);
End;

Procedure ChuanBi;
Var x: longint;
Begin
 Fillchar(tt,sizeof(tt),1);
 x:=1;
 sp:=0;
 While x<n do
 begin
   inc(sp);
   x:=x shl 1;
 end;
End;

Procedure Tim1(Var i: integer);
Var ii: integer;
Begin
 i:=0;
 For ii:=1 to n do
   If tt1[ii]=1 then
   begin
     i:=ii;
     exit;
   end
End;

Procedure Tim0(Var i: integer);
Var ii:	integer;
Begin
 i:=0;
 For ii:=1 to n do
   If tt[ii]=0 then
   begin
     i:=ii;
     exit;
   end
End;

Function ThuGhepTiepDuoc: boolean;
Var i,j: integer;
Begin
 ThuGhepTiepDuoc:=false;
 Tim1(i);
 tt1[i]:=0;
 Tim1(j);
 tt1[j]:=0;
 If (i=0)or(j=0) then exit;
 Write(f,'(',i,',',j,') ');
 tt[j]:=0;
 dec(sl);
 ThuGhepTiepDuoc:=true;
End;

Procedure ThongTinDau;
Begin
 tt1:=tt;
 Repeat
   ketthuc:=not ThuGhepTiepDuoc;
 Until ketthuc;
End;

Function TraoTiepDuoc: boolean;
Var i,j: integer;
Begin
 TraoTiepDuoc:=false;
 Tim1(i);
 tt1[i]:=0;
 Tim0(j);
 If (i=0)or(j=0) then exit;
 tt[j]:=1;
 inc(sl);
 Write(f,'(',i,',',j,') ');
 TraoTiepDuoc:=true;
End;

Procedure ThongTinCuoi;
Begin
 tt1:=tt;
 Repeat
   ketthuc:=not TraoTiepDuoc;
 Until ketthuc;
End;

Procedure LapKeHoach;
Begin
 Assign(f,fg); Rewrite(f);
 Writeln(f,sp*2);
 sl:=n;
 While sl<>1 do
 begin
   ThongTinDau;
   Writeln(f);
 end;
 While sl<>n do
 begin
   ThongTinCuoi;
   Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 ChuanBi;
 LapKeHoach;
END.