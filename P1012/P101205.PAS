Program P101205;  {Kiem tra hoan vi chan}
Uses Crt;
Var  i,n: byte;

Procedure Kiemtra(var n: byte);
Var a: array[1..765] of integer;
    i,j,count: integer;
Begin
 For i:=1 to n do a[i]:=3*i-2;
 For i:=n+1 to 2*n do a[i]:=a[i-n]+1;
 For i:=2*n+1 to 3*n do a[i]:=a[i-2*n]+2;
 count:=0;
 For i:=1 to 3*n-1 do
   For j:=i+1 to 3*n do If a[j]<a[i] then inc(count);
 If (count mod 2)=0 then
   Writeln('Voi n:=',n,' thi co so nghich the la chan.')
 Else Writeln('Voi n:=',n,' thi co so nghich the la le.');
 If WhereY>=25 then begin Readln; Clrscr; end;
End;

BEGIN
 Clrscr;
 For i:=1 to 255 do Kiemtra(i);
END.