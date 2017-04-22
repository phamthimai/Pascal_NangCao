Program P100410;   {Lap cac mang doi xung B va C tu mang A}
Uses Crt;
Var  A,B,C: array[1..50,1..50] of integer;
     n,i,j: integer;

BEGIN
 Clrscr;
 Write(' Nhap kich thuoc cua mang vuong: n = '); Readln(n);
 Writeln(' Nhap ma tran A: ');
 For i:=1 to n do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 For i:=1 to n do
   For j:=1 to n do
     If j>=i then begin b[i,j]:=a[i,j]; c[i,j]:=a[j,i]; end
     Else         begin b[i,j]:=a[j,i]; c[i,j]:=a[i,j]; end;
 Writeln('Ma tran B la:');
 For i:=1 to n do
 begin
   For j:=1 to n do write(b[i,j]:4); Writeln;
 end;
 Writeln('Ma tran C la:');
 For i:=1 to n do
 begin
   For j:=1 to n do write(c[i,j]:4); Writeln;
 end;
 Readln;
END.