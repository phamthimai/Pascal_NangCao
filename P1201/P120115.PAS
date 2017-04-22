Program P120114;  {Tim ma tran nghich dao}
Uses Crt;
Type mt=array [1..10,1..10] of real;
Var  a,c: mt;
     i,j,n: byte;
     d: real;

Function Sign(h: byte): integer;
Begin
 If Odd(h) then Sign:=-1 Else Sign:=1;
End;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,'IN.DAT'); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
 Writeln('Ma tran A:');
 For i:=1 to n do
 begin
   For j:=1 to n do Write(a[i,j]:6:2); Writeln;
 end;
End;

Procedure Xuat;
Var f: text;
Begin
 Assign(f,'OUTPUT.DAT'); Rewrite(f);
 Writeln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,c[i,j]:6:2); Writeln(f);
 end;
 Close(f);
 Writeln('Ma tran nghich dao cua A: ');
 For i:=1 to n do
 begin
   For j:=1 to n do Write(c[i,j]:6:2); Writeln;
 end;
 Readln;
End;

Function Det(b: mt; m,r,s: byte): real;
Var p,q: byte; d: real;
Begin
 For p:=r to m do
   For q:=1 to m+1 do b[p,q]:=b[p+1,q];
 For p:=1 to m do
   For q:=s to m do b[p,q]:=b[p,q+1];
 d:=0;
 If m=1 then d:=b[1,1]
 Else For p:=1 to m do d:=d-sign(p)*b[p,1]*det(b,m-1,p,1);
 Det:=d;
End;

BEGIN
 Clrscr;
 Nhap;
 d:=det(a,n,n+1,n+1);   {detA}
 For i:=1 to n do
   For j:=1 to n do c[i,j]:=sign(i+j)*det(a,n-1,j,i)/d;
 Xuat;
END.

