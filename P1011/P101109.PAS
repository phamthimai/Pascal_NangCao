Program  P101109;  {Lap ma tran lien thong B cua ma tran A}
Uses  Crt;
Const nmax=100;
      mmax=100;
      inp='P1011\A.TXT';
      out='P1011\B.TXT';
Var   f: text;
      m,n: byte;
      a: array [1..mmax,1..nmax] of 0..1;
      b: array [1..mmax,1..nmax] of integer;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]);
   Readln(f);
 end;
 Close(f);
End;

Function Ok(i1,j1,i2,j2: byte): boolean;
Var i,j: byte;
Begin
 Ok:=false;
 For i:=i1 to i2 do
   For j:=j1 to j2 do
     If a[i,j]<>a[i1,j1] then exit;
 Ok:=true;
End;

Procedure GhiNhan(i1,j1,i2,j2: byte; s: integer);
Var i,j: byte;
Begin
 For i:=i1 to i2 do
   For j:=j1 to j2 do
     If b[i,j]<s then b[i,j]:=s;
End;

Procedure LapBang;
Var i1,j1,i2,j2:byte;
Begin
 FillChar(b,Sizeof(b),0);
 For i1:=1 to m do
   For j1:=1 to n do
     For i2:=m downto 1 do
       For j2:=n downto 1 do
         If (a[i1,j1]=a[i2,j2])and(Ok(i1,j1,i2,j2))
           then GhiNhan(i1,j1,i2,j2,(i2-i1+1)*(j2-j1+1));
End;

Procedure InKQ;
Var i,j: byte;
Begin
 Assign(f,out); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,b[i,j]:4);
   Writeln(f);
 end;
 Readln;
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 LapBang;
 InKQ;
END.
3 6
0 1 1 0 1 1
0 0 1 1 1 0
0 0 0 1 1 0