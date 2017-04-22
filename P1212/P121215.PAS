Program P121215;          {Sai}
{Kiem tra diem M nam trong hay ngoai da giac}
Uses  Crt;
Const fn  = 'P1212\DAGIAC.INP';
      fg  = 'DAGIAC.OUT';
      max = 100;
Var   x,y  : array [0..max+1] of real;
      n    : integer;
      a,b,c: array [1..max] of real;
      xd,yd: real;

Procedure Nhap;
Var f: text; i: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,x[i],y[i]);
 Readln(f,xd,yd);
 Close(f);
End;

Procedure Chuanbi;
Begin
 x[0]:=x[n]; y[0]:=y[n];
 x[n+1]:=x[1]; y[n+1]:=y[1];
End;

Procedure Lapft(i: integer);
Begin
 a[i]:=y[i-1]-y[i];
 b[i]:=x[i]-x[i-1];
 c[i]:=-(a[i]*x[i]+b[i]*y[i]);
End;

Procedure Tinhft;
Var i: integer;
Begin
 For i:=1 to n do lapft(i);
End;

Function ft(k: integer; x,y: real): real;
Begin
 ft:=a[k]*x+b[k]*y+c[k];
End;

Function namtren: boolean;
Var i: integer;
Begin
 namtren:=true;
 For i:=1 to n do
   If (ft(i,xd,yd)=0)and((xd-x[i-1])*(xd-x[i])<=0)
     and((yd-y[i-1])*(yd-y[i])<=0) then exit;
 namtren:=false;
End;

Function catthang(i: integer): boolean;
Begin
 Catthang:=false;
 If (x[i-1]>=xd)or(x[i]<xd) then exit;
 If (x[i]=xd)and((x[i-1]-xd)*(x[i+1]-xd)>=0) then exit;
 catthang:=true;
End;

Function namtrong: boolean;
Var i,tong: integer;
Begin
 tong:=0;
 For i:=1 to n do
   If catthang(i) then Inc(tong);
 namtrong:=tong mod 2=1;
End;

Procedure ra(s: string);
Var f: text;
Begin
 Assign(f,fg); Rewrite(f);
 Write(f,s);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Tinhft;
 If not namtren then
   If namtrong then ra('Diem nam trong da giac.')
   Else             ra('Diem nam ngoai da giac.')
 Else ra('Diem nam tren canh da giac.');
END.