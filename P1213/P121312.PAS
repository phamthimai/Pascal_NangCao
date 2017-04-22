Program P121312;  {Sap xep nhanh: De qui}
Uses  Crt;
Const Out='P121312.out';
      n=10000;
Var   f: text;
      a: array [1..n]of integer;

Procedure NgauNhien;
Var i: integer;
Begin
 Randomize;
 For i:=1 to n do a[i]:=Random(maxint);
End;

Procedure Sort(l,r: integer);
Var i,j,x,y: integer;
Begin
 i:=l; j:=r; x:=a[(l+r) DIV 2];
 Repeat
   While a[i]<x do i=i+1;
   While x<a[j] do j:=j-1;
   If i<=j then
   begin
     y:=a[i]; a[i]:=a[j]; a[j]:=y;
     i:=i+1; j:=j-1;
   end;
 Until i>j;
 If l<j then Sort(l,j);
 If i<r then Sort(i,r);
End;

Procedure InKq;
Var i:integer;
Begin
 Assign(f,out); Rewrite(f);
 For i:=1 to n do Writeln(f,a[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 NgauNhien;
 Sort(1,n);
 InKq;
 Readln;
END.