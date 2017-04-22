Program P100315;    {Tinh gia tri da thuc}
Uses Crt;
Var  i,j,n: integer;
     f: text;
     a: array [0..100] of real;
     x,s: real;

BEGIN
 Clrscr;
 Assign(f,'P10\P100315.TXT'); Reset(f);
 n:=-1;
 While not SeekEoF(f) do
 begin
   Readln(f,i,j);
   Inc(n);
   If j<>0 then a[n]:=i/j else a[n]:=0;
 end;
 Close(f);
 Write('Nhap x: '); Readln(x);
 s:=0; For i:=n downto 0 do s:=s*x+a[i];
 Write('f(x) = ',s:0:2);
 Readln;
END.

