Program P100413;   {Bo hang thu p va cot thu q cua ma tran A}
Uses Crt;
Var  A: array[1..50,1..50] of integer;
     i,j,n,p,q: integer;

Procedure Nhap;
Begin
 Clrscr;
 Write('Nhap kich thuoc cua ma tran vuong A: n = '); Readln(n);
 Writeln('Nhap ma tran A: ');
 For i:=1 to n do
   begin For j:=1 to n do Read(a[i,j]); Readln; end;
 Write(' Nhap p,q: '); Readln(p,q);
End;

Procedure Xuat;
Begin
 Writeln('Ma tran A bo di hang thu ',p,', va cot thu ',q,' la:');
 For i:=1 to n-1 do
   begin For j:=1 to n-1 do write(a[i,j]:4); Writeln; end;
 Readln;
End;

Procedure Bohang(p: integer);
Begin
 For i:=p to n-1 do
   For j:=1 to n do a[i,j]:=a[i+1,j];
End;

Procedure Bocot(q: integer);
Begin
 For i:=1 to n-1 do
   For j:=q to n-1 do a[i,j]:=a[i,j+1];
End;

BEGIN
 Nhap;
 Bohang(p);
 Bocot(q);
 Xuat;
END.
