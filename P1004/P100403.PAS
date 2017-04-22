Program P100403;   {Lap mang A}
Uses  Crt;
Const m=10; n=12;
Var   a: array[1..m,1..n] of integer;
      i,j: integer;

BEGIN
 Clrscr;
 For i:=1 to m do
   For j:=1 to n do a[i,j]:=i+2*j;
 Writeln('Ma tran A la:');
 For i:=1 to m do
 begin
   For j:=1 to n do write(a[i,j]:4); Writeln;
 end;
 Readln;
END.