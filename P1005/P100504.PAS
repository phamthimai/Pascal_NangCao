Program P100504;   {Kiem tra Ma tran thua}
Uses Crt;
Var  a: array[1..50,1..50] of real;
     m,n,i,j,d: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua ma tran (m, n): '); Readln(m,n);
 Writeln('Nhap ma tran: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 d:=0;
 For i:=1 to m do
   For j:=1 to n do If a[i,j]=0 then Inc(d);
 If 2*d>m*n then Write('Ma tran thua.')
 Else Write('Ma tran khong thua.');
 Readln;
END.