Program P100512; {Ket qua Xo so}
Uses  Crt;
Const nmax=500;
Var   f: text;
      n,m,vi_tri: integer;
      sum: longint;
      a,b,c: array[1..nmax] of integer;

Procedure Nhap;
Var i: byte;
Begin
 Assign(f,'INP.TXT');
 Reset(f);
 Readln(f,n,m);
 For i:=1 to n do Read(f,a[i]);
 Readln(f);
 For i:=1 to n do Read(f,b[i]);
 Readln(f);
 For i:=1 to m do Read(f,c[i]);
 Close(f);
End;

Procedure Tim(i: integer);
Var dau,cuoi,giua: integer;
Begin
 dau:=1; cuoi:=n;
 Repeat
   giua:=(dau+cuoi) div 2;
   If c[i]<=a[giua] then cuoi:=giua
   Else dau:=giua;
 Until dau+1=cuoi;
 If a[cuoi]=c[i] then sum:=sum+b[cuoi]
 Else If a[dau]=c[i] then sum:=sum+b[dau];
End;

Procedure Xu_ly;
Var i: integer;
Begin
 sum:=0;
 For i:=1 to m do tim(i);
 Writeln('Tong so tien thuong: ',sum);
 Readln;
End;

BEGIN
 Clrscr;
 Nhap;
 Xu_ly;
END.