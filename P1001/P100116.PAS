Program P100116;    {Doi cho cac phan tu cua day}
Uses Crt;
Var  n,i,j: integer;
     a: array [1..100] of real;

Procedure Doi_cho(i,j: integer);
Var tg: real;
Begin
 tg:=a[i]; a[i]:=a[j]; a[j]:=tg;
End;

BEGIN
 Clrscr;
 Write('Nhap do dai cua mot day so: N = '); Readln(n);
 Writeln('Nhap mot day ',n,' so:');
 For i:=1 to n do Read(a[i]); Readln;
 i:=1; j:=n;
 Repeat
   While a[i]>0 do inc(i);
   While a[j]<=0 do dec(j);
   If i<j then Doi_cho(i,j);
 Until j<=i;
 j:=n;
 Repeat
   While a[i]>=0 do inc(i);
   While a[j]<0 do dec(j);
   If i<j then Doi_cho(i,j);
 Until j<=i;
 For i:=1 to n do Write(a[i]:4:0);
 Readln;
END.