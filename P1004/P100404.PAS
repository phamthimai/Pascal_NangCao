Program P100204;   {Lap mang C tu 2 day so A va B}
Uses  Crt;
Const m=20; n=10;
Var   A: array[1..n] of real;
      B: array[1..m] of real;
      C: array[1..m,1..n] of real;
      i,j: integer;

BEGIN
 Clrscr;
 Writeln('Nhap cac phan tu cua day A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 Writeln('Nhap cac phan tu cua day B tren mot dong:');
 For i:=1 to m do Read(b[i]); Readln;
 For i:=1 to m do
   For j:=1 to n do C[i,j]:=a[j]/(1+abs(b[i]));
 Writeln('Mang C la:');
 For i:=1 to m do
 begin
   For j:=1 to n do  Write(C[i,j]:7:2); Writeln;
 end;
 Readln;
END.