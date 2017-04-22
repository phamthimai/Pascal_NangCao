Program P121313;     {Sap xep nhanh: Khong de qui}
Uses  Crt;
Const Out='P121313.out';
      n=10000;
Type  st = record
             Left,Right:integer;
           end;
Var   f: text;
      a: array [1..n] of integer;

Procedure NgauNhien;
Var i: integer;
Begin
 Randomize;
 For i:=1 to n do a[i]:=Random(maxint);
End;

Procedure Sort;
Var s,L,R,i,j,x,t: integer; stack: array [1..n] of st;
Begin
 s:=1;
 stack[1].Left:=1;
 stack[1].Right:=n;
 Repeat
   L:=stack[s].Left;
   R:=stack[s].Right;
   s:=s-1;
   i:=L; j:=R;
   X:=a[(L+R) div 2];
   Repeat
     While a[i]<X do i:=i+1;
     While a[j]>X do j:=j-1;
     If i<=j then
     begin
       t:=a[i];
       a[i]:=a[j];
       a[j]:=t;
       i:=i+1; j:=j-1;
     end;
   Until i>j;
   If l<j then
   begin
     s:=s+1;
     stack[s].Left:=l;
     stack[s].Right:=j;
   end;
   If i<r then
   begin
     s:=s+1;
     stack[s].Left:=i;
     stack[s].Right:=r;
   end;
 Until s=0
End;

Procedure InKq;
Var i: integer;
Begin
 Assign(f,out); Rewrite(f);
 For i:=1 to n do Writeln(f,a[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 NgauNhien;
 Sort;
 InKq;
END.