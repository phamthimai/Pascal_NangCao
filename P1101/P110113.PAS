Program P110113b;
Uses  Crt;
Var   b: array [1..10,1..10] of real;
      n,i,j: integer;

Procedure Nhap;
Begin
 Write('Nhap so N: '); Readln(N);
End;

Procedure Xuat;
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(b[i,j]:8:5); Writeln;
   end;
End;

BEGIN
 Nhap;
 For i:=1 to n do
 begin
   b[i,1]:=1/i;
   For j:=2 to n do b[i,j]:=b[i,j-1]/j;
 end;
 Xuat;
 Readln;
END.