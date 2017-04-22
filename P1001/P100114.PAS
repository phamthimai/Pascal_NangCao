Program P100114;      {Tinh tong}
Uses Crt;
Var  i: integer;
     s: real;
     a: array [1..10] of real;

Function Mu(a: real; n: integer): real;
Var i: integer; s: real;
Begin
 s:=1;
 For i:=1 to n do s:=s*a;
 Mu:=s;
End;

BEGIN
 Clrscr;
 Writeln('Nhap mot day 10 so:');
 For i:=1 to 10 do
 begin
   Write('  a[',i:2,'] = '); Readln(a[i]);
 end;
 s:=0;
 For i:=1 to 10 do s:=s+Mu(a[i],i);
 Write(' S = ',s:0:5);
 Readln;
END.