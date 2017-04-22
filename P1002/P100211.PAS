Program P100211; {Tinh tong x1*y1+x2*y2+...xs*ys}
Uses Crt;
Var  A,x,y: array[1..100] of real;
     B: real;
     n,p,q,i,s: integer;

BEGIN
 Clrscr;
 Write('Nhap so do dai cua mang A: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 For i:=1 to n do
   If a[i]>0 then begin inc(p); x[p]:=a[i]; end;
 For i:=n downto 1 do
   If a[i]<0 then begin inc(q); y[q]:=a[i]; end;
 If p<q then s:=p Else s:=q;
 B:=0; For i:=1 to n do B:=B+x[i]*y[i];
 Write('Tong x1*y1+x2*y2+...xs*ys = ',B:10:2);
 Readln;
END.