{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 64384,0,655360}
Program P120816;
Uses  Crt;
Const MN = 100;
      fn = 'P1208\P120816.inp';{DULIEU.INP}
      gn = 'P120816.out';
      tg = 18.2*300;
Type  xc     = string[MN];
      mangx  = array [1..MN] of xc;
      mang1b = array [1..MN] of byte;
      mang2b = array [0..MN,0..MN] of byte;
Var   time     : longint absolute 0:$46C;
      time1    : longint;
      s        : mangx;
      kt       : mang1b;
      bang     : mang2b;
      sc,sn,stg: xc;
      n        : integer;
      f,g      : text;

Procedure Nhap;
Begin
 Assign(f,fn); Reset(f);
 n:=0;
 While not Eof(f) do
 begin
   Inc(n); Readln(f,s[n]);
 end;
 Close(f);
End;

Procedure Chuanbi;
Begin
 FillChar(kt,Sizeof(kt),0);
End;

Procedure Latnguoc(x,y,t: byte);
Begin
 If (x=0)or(y=0) then exit;
 If (sc[x]=s[t,y])and(bang[x,y]=bang[x-1,y-1]+1) then
   begin stg:=sc[x]+stg; Latnguoc(x-1,y-1,t); end
 Else If bang[x,y]=bang[x-1,y] then Latnguoc(x-1,y,t)
      Else Latnguoc(x,y-1,t);
End;

Procedure Timchung(t1: byte);
Var i,j,t: byte;
Begin
 FillChar(bang,SizeOf(bang),0);
 For i:=1 to length(sc) do
   For j:=1 to length(s[t1]) do
   begin
     If sc[i]=s[t1,j] then t:=bang[i-1,j-1]+1 Else t:=0;
     If bang[i-1,j]>t then t:=bang[i-1,j];
     If bang[i,j-1]>t then t:=bang[i,j-1];
     bang[i,j]:=t;
   end;
 stg:='';
 Latnguoc(length(sc),length(s[t1]),t1);
 sc:=stg;
End;

Procedure Thamlam;
Var i,j: byte;
Begin
 i:=random(n)+1; sc:=s[i]; kt[i]:=1;
 For i:=1 to n-1 do
 begin
 { writeln(length(sc));}
   Repeat
     j:=random(n)+1;
   Until kt[j]=0;
   kt[j]:=1; Timchung(j);
   If length(sc)<=length(sn) then exit;
 end;
 sn:=sc;
 Writeln(sn,' ',length(sn));
End;

Procedure Cau12;
Begin
 sn:='';
 time1:=time;
 Repeat
   Chuanbi;
   Thamlam;
 Until time-time1>tg;
End;

BEGIN
 Clrscr;
 Randomize;
 Nhap;
 Cau12;
END.
