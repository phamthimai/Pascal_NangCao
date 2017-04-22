Program P100213;    {Tinh tong va tich hai da thuc}
Uses Crt;
Var  A,B,S,P: array[0..100] of real;
     m,n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap bac cua da thuc thu nhat: m = '); Readln(m);
 Writeln('Nhap cac he so cua da thuc thu nhat tren mot dong:');
 For i:=0 to m do Read(a[i]); Readln;
 Write('Nhap bac cua da thuc thu hai:  n = '); Readln(n);
 Writeln('Nhap cac he so cua da thuc thu hai tren mot dong:');
 For i:=0 to n do Read(b[i]); Readln;
 If m<n then j:=n Else j:=m;     {bac cua tong}
 For i:=0 to j do S[i]:=a[i]+b[i];
 Writeln('Tong hai da thuc co he so la:');
 For i:=0 to j do Write(S[i]:8:2); Writeln;
 For i:=0 to m do
   For j:=i to i+n do p[j]:=p[j]+b[j-i]*a[i];
 Writeln('Tich hai da thuc co he so la:');
 For i:=0 to m+n do Write(P[i]:8:2);
 Readln;
END.