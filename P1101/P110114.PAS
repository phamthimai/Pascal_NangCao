Program P110114;  {sap xep thu tu cac doi bong}
Uses  Crt;
Const nmax=50;
      inp='P110114.INP';
      out='P110114.OUT';
Var   a: array [1..nmax,1..nmax] of integer;
      n,i,j: integer;

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

Procedure Xuat;
Var i,j: integer; f: text;
Begin
 Assign(f,out); Rewrite(f);
 Writeln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,a[i,j],' '); Writeln(f);
 end;
 Close(f);
End;

Procedure Doi_cho(i,j: integer);
Var k,tg: integer;
Begin
 For k:=1 to n do
 begin
   tg:=a[i,k]; a[i,k]:=a[j,k]; a[j,k]:=tg;
 end;
 For k:=1 to n do
 begin
   tg:=a[k,i]; a[k,i]:=a[k,j]; a[k,j]:=tg;
 end;
End;

Function Tong_hang(i: integer): integer;
Var k,s: integer;
Begin
 s:=0;
 For k:=1 to n do s:=s+a[i,k];
 Tong_hang:=s;
End;

BEGIN
 Nhap;
 For i:=1 to n do Writeln('Doi ',i:2,': ',Tong_hang(i):3,' diem');
 For i:=1 to n-1 do
   For j:=i+1 to n do If Tong_hang(i)<Tong_hang(j) then Doi_cho(i,j);
 Xuat;
 Readln;
END.