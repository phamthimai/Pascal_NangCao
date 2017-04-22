Program P121214;
{Tim phu cua mot hinh chu nhat boi cac HCN khong so sanh duoc}
Uses  Crt;
Const fn = 'P1212\CHUNHAT.INP';
      fg = 'CHUNHAT.OUT';
      max = 100;
Type  chunhat = record
                  i,j: integer;
                end;
Var   m,n : integer;
      dt  : integer;
      sh  : integer;
      hinh: array [1..max] of chunhat;
      slch: integer;
      chon: array [1..max] of byte;
      dd  : array [0..max+1,0..max+1] of byte;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,m,n);
 Close(f);
End;

Procedure Chuanbi;
Var i,j: integer;
Begin
 dt:=m*n;
 slch:=0;
 FillChar(chon,SizeOf(chon),0);
 FillChar(dd,SizeOf(dd),1);
 For i:=1 to m do
   For j:=1 to n do dd[i,j]:=0;
End;

Procedure Ghinhanhinh;
Var i,j: integer; f: text;
Begin
 Assign(f,fg); Reset(f);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,dd[i,j]:3);
   exit;
 end;
 Close(f);
End;

Function vua(k,i,j: integer): boolean;
Var ii,jj: integer;
Begin
 vua:=false;
 For ii:=1 to hinh[k].i do
   For jj:=1 to hinh[k].j do
     If dd[i+ii-1,j+jj-1]<>0 then exit;
 vua:=true;
End;

Procedure dat(k,i,j: integer);
Var ii,jj: integer;
Begin
 Chon[k]:=1;
 For ii:=1 to hinh[k].i do
   For jj:=1 to hinh[k].j do dd[i+ii-1,j+jj-1]:=k;
End;

Procedure bo(k,i,j: integer);
Var ii,jj: integer;
Begin
 For ii:=1 to hinh[k].i do
   For jj:=1 to hinh[k].j do dd[i+ii-1,j+jj-1]:=0;
 Chon[k]:=0;
End;

Procedure Timdiemtiep(Var ii,jj: integer);
Begin
 While dd[ii,jj]<>0 do
 begin
   Inc(jj);
   If jj>n then begin Inc(ii); jj:=1; end;
 end;
End;

Procedure Duyetcachdat(i: integer; ii,jj: integer);
Var k: integer;
Begin
 If i>sh then
 begin
   ghinhanhinh;
   halt
 end;
 timdiemtiep(ii,jj);
 For k:=1 to sh do
   If chon[k]=0 then
     If vua(k,ii,jj) then
     begin
       dat(k,ii,jj);
       duyetcachdat(i+1,ii,jj);
       bo(k,ii,jj);
     end;
End;

Procedure Chonhinh(i,j: integer);
Begin
 Inc(sh);
 hinh[sh].i:=i; hinh[sh].j:=j;
 Dec(dt,i*j);
End;

Procedure Bohinh(i,j: integer);
Begin
 Inc(dt,i*j);
 Dec(sh);
End;

Function Lonhon(i,j,dt: integer): boolean;
Var ii,jj,tong: integer;
Begin
 ii:=m; jj:=j-1;
 tong:=	0;
 While (ii>i)and(jj>0)and(tong<dt) do
 begin
   Inc(tong,ii*jj);
   Dec(ii); Inc(jj);
 end;
 lonhon:=tong>=dt
End;

Procedure Duyettong(i: integer; lasti,lastj: integer);
Var ii,jj: integer;
Begin
 If dt=0 then
 begin
   Inc(slch);
   duyetcachdat(1,1,1);
   exit;
 end;
 For ii:=lasti+1 to m do
   For jj:=lastj-1 downto 1 do
     If (dt>=ii*jj)and(ii+jj<m+n) then
     begin
       chonhinh(ii,jj);
       If lonhon( ii,jj,dt) then duyettong(i+1,ii,jj);
       bohinh(ii,jj);
     end;
End;

Procedure Vonghiem;
Var f: text;
Begin
 Assign(f,fg); Rewrite(f);
 Write(f,'VO NGHIEM');
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Chuanbi;
 Duyettong(1,0,n+1);
 Vonghiem;
END.