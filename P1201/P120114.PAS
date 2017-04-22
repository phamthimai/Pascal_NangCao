Program P120114;    {Tinh dinh thuc cua matran}
Uses Crt;
Type mt=array[1..10,1..10] of real;
Var  a: mt;
     n: byte;

Function Sign(h: byte): integer;
Begin
 If Odd(h) then sign:=-1 Else sign:=1;
End;

Procedure Nhap;
Var i,j: byte; f: text;
Begin
 Assign(f,'IN.DAT'); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j+1]); Readln(f);
 end;
 Close(f);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(a[i,j+1]:3:0); Writeln;
 end;
End;

Function Det(b: mt; m,s: byte): real;
Var p,q: byte; d: real;
Begin
 For p:=1 to m do
   For q:=1 to m do
     If p<s then b[p,q]:=b[p,q+1]
     Else b[p,q]:=b[p+1,q+1];
 d:=0;
 If m=1 then d:=b[1,1]
 Else For p:=1 to m do d:=d-sign(p)*b[p,1]*det(b,m-1,p);
 Det:=d;
End;

BEGIN
 Clrscr;
 Nhap;
 Write('  Det A = ', det(a,n,n+1):10:0);
 Readln;
END.