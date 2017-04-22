Program P100415; {Doi hang thu p va hang thu q cua ma tran A}
Uses Crt;
Var  A: array[1..50,1..50] of integer;
     i,j,n,p,q: integer;

Procedure Nhap;
Begin
 Clrscr;
 Write('Nhap kich thuoc cua mang vuong: n = '); Readln(n);
 Writeln('Nhap mang A: ');
 For i:=1 to n do
   begin For j:=1 to n do Read(a[i,j]); Readln; end;
 Write('Nhap p,q: '); Readln(p,q);
End;

Procedure Xuat;
Begin
 Writeln('Mang A doi cho hang thu ',p,' va hang thu ',q,' la:');
 For i:=1 to n do
   begin For j:=1 to n do write(a[i,j]:4); Writeln; end;
 Readln;
End;

Procedure Doihang(p,q: integer);
Var i,tg: integer;
Begin
 For i:=1 to n do begin tg:=a[p,i]; a[p,i]:=a[q,i]; a[q,i]:=tg; end;
End;

BEGIN
 Nhap;
 Doihang(p,q);
 Xuat;
END.
