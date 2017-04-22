Program  P111504;
{Duong di ngan nhat tu A den B chi di tren cac canh cua luoi}
Uses Crt;
Var  m,n: byte;
     a: array [1..26,1..26] of longint;

Procedure Chuan_bi;
Var i: byte;
Begin
 Write('Do rong cua luoi (khong qua 25) M = ');Readln(m);
 Write('Do  dai cua luoi (khong qua 25) N = ');Readln(n);
 For i:=1 to m+1 do a[i,1]:=1;
 For i:=1 to n+1 do a[1,i]:=1;
End;

Procedure Xu_ly;
Var i,j: byte;
Begin
 For i:=2 to m+1 do
   For j:=2 to n+1 do a[i,j]:=a[i,j-1]+a[i-1,j];
 Writeln('So cac duong di ngan nhat tu A den B: ',a[m+1,n+1]);
 Readln;
End;

BEGIN
 ClrScr;
 Chuan_bi;
 Xu_ly;
END.