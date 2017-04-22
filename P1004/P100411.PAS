Program P100411;   {Dem so phan tw dwong cua cac mang}
Uses Crt;
Var  A,B,C: array[1..50,1..50] of real;
     i,j,n,d1,d2,d3: integer;

BEGIN
 Clrscr;
 Write(' Nhap kich thuoc cua mang vuong: n = '); Readln(n);
 For i:=1 to n do
   For j:=1 to n do
   begin
     a[i,j]:=sin(i+j/2);
     b[i,j]:=cos(i*i+n);
     c[i,j]:=sin((i*i-j*j)/n);
   end;
 d1:=0; d2:=0; d3:=0;
 For i:=1 to n do
   For j:=1 to n do
   begin
     If a[i,j]>0 then inc(d1);
     If b[i,j]>0 then inc(d2);
     If c[i,j]>0 then inc(d3);
   end;
 Writeln('a. So phan tw dwong la ',d1);
 Writeln('b. So phan tw dwong la ',d2);
 Write('c. So phan tw dwong la ',d3);
 Readln;
END.